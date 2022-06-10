import Carbon
import Cocoa

public enum VirtualModifierKey: String, CaseIterable, Codable, Hashable, Identifiable, Sendable {
  public var id: String { return rawValue }

  case clear = ""
  case shift = "$"
  case function = "fn"
  case control = "^"
  case option = "~"
  case command = "@"

  public var intValue: UInt32 {
    switch self {
    case .clear:
      return 0
    case .shift:
      return UInt32(shiftKey >> 8) & 0xFF
    case .function:
      return 0
    case .control:
      return UInt32(controlKey >> 8) & 0xFF
    case .option:
      return UInt32(optionKey >> 8) & 0xFF
    case .command:
      return UInt32(cmdKey >> 8) & 0xFF
    }
  }

  public static func fromNSEvent(_ eventModifierFlags: NSEvent.ModifierFlags) -> [VirtualModifierKey] {
    VirtualModifierKey.allCases
      .compactMap { eventModifierFlags.contains($0.modifierFlags) ? $0 : nil }
  }

  public static func fromCGEvent(_ event: CGEvent, specialKeys: [Int]) -> [VirtualModifierKey] {
    var specialKeys = specialKeys
    // Don't treat Space & Tab as a special key because it breaks binding it
    // together with the fn-key
    specialKeys.removeAll(where: { $0 == kVK_Space || $0 == kVK_Tab })

    let keyCode = Int(event.getIntegerValueField(.keyboardEventKeycode))
    let flags = event.flags
    let isSpecialKey = specialKeys.contains(keyCode)
    var modifiers = [VirtualModifierKey]()

    if flags.contains(.maskShift) { modifiers.append(.shift) }
    if flags.contains(.maskControl) { modifiers.append(.control) }
    if flags.contains(.maskAlternate) { modifiers.append(.option) }
    if flags.contains(.maskCommand) { modifiers.append(.command) }
    if flags.contains(.maskSecondaryFn) && !isSpecialKey { modifiers.append(.function) }

    return modifiers
  }

  public var symbol: String {
    switch self {
    case .clear:
      return ""
    case .function:
      return "globe"
    case .shift:
      return ""
    case .control:
      return ""
    case .option:
      return ""
    case .command:
      return ""
    }
  }

  public var writtenValue: String {
    switch self {
    case .function, .shift, .clear:
      return ""
    case .control:
      return "control"
    case .option:
      return "option"
    case .command:
      return "command"
    }
  }

  public var keyValue: String {
    switch self {
    case .clear:
      return ""
    case .function:
      return "fn"
    case .shift:
      return "⇧"
    case .control:
      return "⌃"
    case .option:
      return "⌥"
    case .command:
      return "⌘"
    }
  }

  public var pretty: String {
    switch self {
    case .clear:
      return ""
    case .function:
      return "ƒ"
    case .shift:
      return "⇧"
    case .control:
      return "⌃"
    case .option:
      return "⌥"
    case .command:
      return "⌘"
    }
  }

  public var cgModifierFlags: CGEventFlags {
    switch self {
    case .clear:
      return .init(rawValue: 0)
    case .shift:
      return .maskShift
    case .control:
      return .maskControl
    case .option:
      return .maskAlternate
    case .command:
      return .maskCommand
    case .function:
      return .maskSecondaryFn
    }
  }

  public var modifierFlags: NSEvent.ModifierFlags {
    switch self {
    case .clear:
      return NSEvent.ModifierFlags(rawValue: 0)
    case .shift:
      return .shift
    case .control:
      return .control
    case .option:
      return .option
    case .command:
      return .command
    case .function:
      return .function
    }
  }
}
