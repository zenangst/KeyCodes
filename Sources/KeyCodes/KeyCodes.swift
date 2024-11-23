import AppKit
import Carbon

enum KeyCodesError: Error {
  case failedToMapKeyCode(keyCode: Int, modifiers: UInt32)
  case failedToMapSystemKeys
  case failedToGetCurrentInputSource
  case failedToResolveLayoutData(keyCode: Int, modifiers: UInt32)
}

final public class KeyCodes {
  private static let debugSystemKeys: Bool = false

  public init() {}

  public func specialKeys() -> [Int: String] {
    VirtualSpecialKey.keys
  }

  public func systemKeys(from inputSource: TISInputSource) throws -> [VirtualKey] {
    var systemKeysUnmanaged: Unmanaged<CFArray>?

    if CopySymbolicHotKeys(&systemKeysUnmanaged) != noErr {
      throw KeyCodesError.failedToMapSystemKeys
    }

    guard let rawSystemKeys = systemKeysUnmanaged?.takeRetainedValue() as? [[String: Any]] else {
      throw KeyCodesError.failedToMapSystemKeys
    }

    var values = [VirtualKey]()
    values.reserveCapacity(rawSystemKeys.count)

    for entry in rawSystemKeys {
      guard let systemKey = VirtualSystemKey(entry), systemKey.isEnabled else { continue }

      if systemKey.keyCode > 127 { continue }

      let rawModifierKeys = CGEventFlags(carbon: systemKey.carbonModifiers)
      let rawValue = try resolveRawValue(for: systemKey.keyCode, modifiers: UInt32(rawModifierKeys.rawValue), from: inputSource)
      let displayValue = VirtualSpecialKey.keys[systemKey.keyCode] ?? rawValue.uppercased()
      let modifierKeys = VirtualModifierKey.modifiers(for: systemKey.keyCode, flags: rawModifierKeys, specialKeys: Array(specialKeys().keys))
      let value = VirtualKey(keyCode: systemKey.keyCode, rawValue: rawValue,
                             modifiers: modifierKeys, displayValue: displayValue)

      if Self.debugSystemKeys {
        print(value.keyCode, displayValue, systemKey.carbonModifiers)
      }

      if !(0..<128).contains(value.keyCode) || modifierKeys.isEmpty {
        continue
      }

      values.append(value)
    }

    if Self.debugSystemKeys {
      print(values.count)
    }

    return values
  }

  @MainActor
  public func mapKeyCodes(from inputSource: TISInputSource) throws -> VirtualKeyContainer {
    var storage = [String: VirtualKey]()
    var modifierPairs: [[VirtualModifierKey]] = VirtualModifierKey
      .allCases
      .map { [$0] }
    modifierPairs.append([.rightOption, .leftShift])

    for intValue in 0..<128 {
      do {
        let value = try value(for: intValue, modifiers: [], from: inputSource)
        mapAndStore(value, modifiers: [], storage: &storage)
      }

      do {
        for modifiers in modifierPairs {
          let value = try value(for: intValue, modifiers: modifiers, from: inputSource)
          mapAndStore(value, modifiers: modifiers, storage: &storage)
        }
      }
    }

    return VirtualKeyContainer(storage)
  }

  public func value(for keyCode: Int, modifiers: [VirtualModifierKey], from inputSource: TISInputSource) throws -> VirtualKey {
    let displayValue: String
    let rawValue: String
    if let specialKey = VirtualSpecialKey.keys[keyCode] {
      displayValue = specialKey
      rawValue = try resolveRawValue(for: keyCode, modifiers: modifiers.intValue, from: inputSource)
    } else {
      displayValue = try resolveRawValue(for: keyCode, modifiers: modifiers.intValue, from: inputSource)
      rawValue = displayValue
    }

    return VirtualKey(
      keyCode: keyCode,
      rawValue: rawValue,
      modifiers: modifiers,
      displayValue: displayValue.trimmingCharacters(in: .controlCharacters))
  }

  internal func mapAndStore(_ virtualKey: VirtualKey, modifiers: [VirtualModifierKey], storage: inout [String: VirtualKey]) {
    storage[virtualKey.keyCode.withModifiers(modifiers).prefix(.keyCode)] = virtualKey

    if virtualKey.displayValue.isEmpty { return }

    // Special handling for Function keys.
    if !virtualKey.displayValue.hasPrefix("F") &&
        !virtualKey.displayValue.hasPrefix("#") &&
        storage[virtualKey.rawValue.withModifiers(modifiers).prefix(.rawValue)] != nil {
      return
    }

    storage[virtualKey.displayValue.withModifiers(modifiers).prefix(.displayValue)] = virtualKey
    storage[virtualKey.rawValue.withModifiers(modifiers).prefix(.rawValue)] = virtualKey
  }

  private func resolveRawValue(for keyCode: Int, modifiers: UInt32, from inputSource: TISInputSource) throws -> String {
    let cgEventFlags = CGEventFlags(rawValue: UInt64(modifiers))
    let modifiers = UInt32(cgEventFlags.rawValue)

    guard let layoutData = TISGetInputSourceProperty(inputSource, kTISPropertyUnicodeKeyLayoutData) else {
      throw KeyCodesError.failedToResolveLayoutData(keyCode: keyCode, modifiers: modifiers)
    }

    let dataRef = unsafeBitCast(layoutData, to: CFData.self)
    let keyLayout = unsafeBitCast(CFDataGetBytePtr(dataRef), to: UnsafePointer<UCKeyboardLayout>.self)
    let keyTranslateOptions = OptionBits(kUCKeyTranslateNoDeadKeysBit)
    let maxChars = 4

    var deadKeyState: UInt32 = 0
    var chars = [UniChar](repeating: 0, count: maxChars)
    var length = 0

    let modifierKeyState: UInt32 = UInt32(cgEventFlags.carbon)
    let error = UCKeyTranslate(
      keyLayout,
      UInt16(keyCode),
      UInt16(CoreServices.kUCKeyActionDisplay),
      ((modifierKeyState) >> 8) & 0xFF,
      UInt32(LMGetKbdType()),
      keyTranslateOptions,
      &deadKeyState,
      maxChars,
      &length,
      &chars)

    if error != noErr {
      throw KeyCodesError.failedToMapKeyCode(keyCode: keyCode, modifiers: modifiers)
    }

    return String(utf16CodeUnits: chars, count: length)
  }
}

extension Collection where Element == VirtualModifierKey {
  var intValue: UInt32 {
    var cgFlags = CGEventFlags(rawValue: 0)
    for element in self {
      cgFlags.insert(element.cgEventFlags)
    }

    return UInt32(cgFlags.rawValue)
  }
}

extension CGEventFlags {
  var carbon: Int {
    var modifierFlags = 0

    if contains(.maskControl) { modifierFlags |= controlKey }
    if contains(.maskAlternate) { modifierFlags |= optionKey }
    if contains(.maskShift) { modifierFlags |= shiftKey }
    if contains(.maskCommand) { modifierFlags |= cmdKey }

    return modifierFlags
  }

  init(carbon: Int) {
    self.init()
    if carbon & controlKey == controlKey { insert(.maskControl) }
    if carbon & optionKey == optionKey { insert(.maskAlternate) }
    if carbon & shiftKey == shiftKey { insert(.maskShift) }
    if carbon & cmdKey == cmdKey { insert(.maskCommand) }
  }
}
