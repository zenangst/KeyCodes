import AppKit
import Carbon

enum KeyCodesError: Error {
  case failedToMapKeyCode(keyCode: Int, modifiers: UInt32)
  case failedToMapSystemKeys
}

final public class KeyCodes {

  public init() {}

  public func specialKeys() -> [Int: String] {
    Special.keys
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

      let nsEventFlags = NSEvent.ModifierFlags(carbon: systemKey.carbonModifiers)
      let modifierKeys = VirtualModifierKey.fromNSEvent(nsEventFlags)
        .filter({ $0 != .clear })
      let intValue = modifierKeys.intValue
      let rawValue = try rawValue(for: systemKey.keyCode, modifier: intValue, from: inputSource)
      let displayValue = Special.keys[systemKey.keyCode] ?? rawValue
      let value = VirtualKey(keyCode: systemKey.keyCode, rawValue: rawValue,
                                modifiers: modifierKeys, displayValue: displayValue)

      if !(0..<128).contains(value.keyCode) || modifierKeys.isEmpty {
        continue
      }

      values.append(value)
    }

    return values
  }

  public func mapKeyCodes(from inputSource: TISInputSource) async throws -> VirtualKeyContainer {
    var storage = [VirtualKey]()
    for intValue in 0..<128 {
      for modifier in VirtualModifierKey.allCases {
        let value = try value(for: intValue, modifiers: [modifier], from: inputSource)
        storage.append(value)
      }

      let value = try value(for: intValue, modifiers: [.option, .shift], from: inputSource)
      storage.append(value)
    }

    return VirtualKeyContainer(storage)
  }

  public func value(for keyCode: Int, modifier: VirtualModifierKey,
                    from inputSource: TISInputSource) throws -> VirtualKey {
    try value(for: keyCode, modifiers: [modifier], from: inputSource)
  }

  public func value(for keyCode: Int, modifiers: [VirtualModifierKey],
                    from inputSource: TISInputSource) throws -> VirtualKey {
    let rawValue = try rawValue(for: keyCode, modifier: modifiers.intValue, from: inputSource)
    let displayValue = Special.keys[keyCode] ?? rawValue
    return VirtualKey(
      keyCode: keyCode,
      rawValue: rawValue,
      modifiers: modifiers,
      displayValue: displayValue)
  }

  private func rawValue(for keyCode: Int, modifier: UInt32,
                from inputSource: TISInputSource) throws -> String {
    let layoutData = TISGetInputSourceProperty(inputSource, kTISPropertyUnicodeKeyLayoutData)
    let dataRef = unsafeBitCast(layoutData, to: CFData.self)
    let keyLayout = unsafeBitCast(CFDataGetBytePtr(dataRef),
                                  to: UnsafePointer<CoreServices.UCKeyboardLayout>.self)
    let keyTranslateOptions = OptionBits(CoreServices.kUCKeyTranslateNoDeadKeysBit)
    let maxChars = 256
    var deadKeyState: UInt32 = 0
    var chars = [UniChar](repeating: 0, count: maxChars)
    var length = 0

    let error = CoreServices.UCKeyTranslate(
      keyLayout,
      UInt16(keyCode),
      UInt16(CoreServices.kUCKeyActionDisplay),
      modifier,
      UInt32(LMGetKbdType()),
      keyTranslateOptions,
      &deadKeyState,
      maxChars,
      &length,
      &chars)

    if error != noErr {
      throw KeyCodesError.failedToMapKeyCode(keyCode: keyCode, modifiers: modifier)
    }

    return String(utf16CodeUnits: &chars, count: length)
  }
}

extension Collection where Element == VirtualModifierKey {
  var intValue: UInt32 {
    reduce(into: 0) { partialResult, element in
      partialResult = partialResult | element.intValue
    }
  }
}
