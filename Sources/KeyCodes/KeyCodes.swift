import Carbon

enum KeyCodesError: Error {
  case failedToMapKeyCode(keyCode: Int, modifiers: UInt32)
}

final public class KeyCodes {
  public enum Modifier: CaseIterable {
    case clear
    case shift
    case option
    case shiftOption

    public var int: UInt32 {
      switch self {
      case .clear:
        return 0
      case .shift:
        return UInt32(shiftKey >> 8) & 0xFF
      case .option:
        return UInt32(optionKey >> 8) & 0xFF
      case .shiftOption:
        return Modifier.shift.int | Modifier.option.int
      }
    }
  }

  public init() { }

  public func specialKeys() -> [Int: String] {
    Special.keys
  }

  public func mapKeyCodes(from inputSource: TISInputSource) async throws -> KeyCodesContainer {
    var storage = [KeyCodesValue]()
    for intValue in 0..<128 {
      for modifier in Modifier.allCases {
        let value = try value(for: intValue, modifier: modifier, from: inputSource)
        storage.append(value)
      }
    }

    return KeyCodesContainer(storage)
  }

  public func value(for keyCode: Int, modifier: Modifier,
                    from inputSource: TISInputSource) throws -> KeyCodesValue {
    let rawValue = try rawValue(for: keyCode, modifier: modifier.int, from: inputSource)
    let displayValue = Special.keys[keyCode] ?? rawValue
    return KeyCodesValue(
      keyCode: keyCode,
      modifier: modifier,
      rawValue: rawValue,
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

    return NSString(characters: &chars, length: length) as String
  }
}
