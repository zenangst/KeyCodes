import Carbon
import Cocoa

public enum VirtualModifierKey: String, CaseIterable, Codable, Hashable, Identifiable, Sendable {
  public var id: String { return rawValue }

  case function = "fn"
  case capsLock = "⇪"
  case numpad = "#"

  case leftShift = "$"
  case leftControl = "^"
  case leftOption = "~"
  case leftCommand = "@"

  case rightShift = "r$"
  case rightControl = "r^"
  case rightOption = "r~"
  case rightCommand = "r@"

  public static func fromCGEvent(_ flags: CGEventFlags) -> [VirtualModifierKey] {
    var modifiers = [VirtualModifierKey]()

    if flags.contains(.maskLeftShift)      { modifiers.append(.leftShift) }
    if flags.contains(.maskLeftControl)    { modifiers.append(.leftControl) }
    if flags.contains(.maskLeftAlternate)  { modifiers.append(.leftOption) }
    if flags.contains(.maskLeftCommand)    { modifiers.append(.leftCommand) }

    if flags.contains(.maskRightShift)     { modifiers.append(.rightShift) }
    if flags.contains(.maskRightControl)   { modifiers.append(.rightControl) }
    if flags.contains(.maskRightAlternate) { modifiers.append(.rightOption) }
    if flags.contains(.maskRightCommand)   { modifiers.append(.rightCommand) }

    if flags.contains(.maskShift) && !flags.contains(.maskLeftShift) && !flags.contains(.maskRightShift) {
      modifiers.append(.leftShift)
    }

    if flags.contains(.maskControl) && !flags.contains(.maskLeftControl) && !flags.contains(.maskRightControl) {
      modifiers.append(.leftControl)
    }

    if flags.contains(.maskAlternate) && !flags.contains(.maskLeftAlternate) && !flags.contains(.maskRightAlternate) {
      modifiers.append(.leftOption)
    }

    if flags.contains(.maskCommand) && !flags.contains(.maskLeftCommand) && !flags.contains(.maskRightCommand) {
      modifiers.append(.leftCommand)
    }

    if flags.contains(.maskAlphaShift)     { modifiers.append(.capsLock) }
    if flags.contains(.maskSecondaryFn)    { modifiers.append(.function) }
    if flags.contains(.maskNumericPad)     { modifiers.append(.numpad) }

    return modifiers
  }

  public var cgEventFlags: CGEventFlags {
    var modifierFlags = CGEventFlags.maskNonCoalesced
    switch self {
    case .leftShift:
      modifierFlags.insert(.maskShift)
      modifierFlags.insert(.maskLeftShift)
    case .rightShift:
      modifierFlags.insert(.maskShift)
      modifierFlags.insert(.maskRightShift)
    case .leftControl:
      modifierFlags.insert(.maskControl)
      modifierFlags.insert(.maskLeftControl)
    case .rightControl:
      modifierFlags.insert(.maskControl)
      modifierFlags.insert(.maskRightControl)
    case .leftOption:
      modifierFlags.insert(.maskAlternate)
      modifierFlags.insert(.maskLeftAlternate)
    case .rightOption:
      modifierFlags.insert(.maskAlternate)
      modifierFlags.insert(.maskRightAlternate)
    case .leftCommand:
      modifierFlags.insert(.maskCommand)
      modifierFlags.insert(.maskLeftCommand)
    case .rightCommand:
      modifierFlags.insert(.maskCommand)
      modifierFlags.insert(.maskRightCommand)
    case .function:
      modifierFlags.insert(.maskSecondaryFn)
    case .capsLock:
      modifierFlags.insert(.maskAlphaShift)
    case .numpad:
      modifierFlags.insert(.maskNumericPad)
    }

    return modifierFlags
  }
}
