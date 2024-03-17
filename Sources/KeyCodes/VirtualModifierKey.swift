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
  case capsLock = "⇪"

  public var intValue: UInt32 {
    switch self {
    case .clear:    0
    case .shift:    UInt32(shiftKey >> 8) & 0xFF
    case .function: 0
    case .control:  UInt32(controlKey >> 8) & 0xFF
    case .option:   UInt32(optionKey >> 8) & 0xFF
    case .command:  UInt32(cmdKey >> 8) & 0xFF
    case .capsLock: UInt32(alphaLock >> 8) & 0xFF
    }
  }

  public static func fromNSEvent(_ eventModifierFlags: NSEvent.ModifierFlags) -> [VirtualModifierKey] {
    VirtualModifierKey.allCases
      .compactMap { eventModifierFlags.contains($0.modifierFlags) ? $0 : nil }
  }

  public static func fromCGEvent(_ event: CGEvent, specialKeys: [Int]) -> [VirtualModifierKey] {
    var specialKeys = specialKeys
    // Don't treat Space & Tab or Escape as a special key because it breaks binding it
    // together with the fn-key
    specialKeys.removeAll(where: { $0 == kVK_Space || $0 == kVK_Tab || $0 == kVK_Escape })

    let keyCode = Int(event.getIntegerValueField(.keyboardEventKeycode))
    let flags = event.flags
    let isSpecialKey = specialKeys.contains(keyCode)
    var modifiers = [VirtualModifierKey]()

    if flags.contains(.maskShift) { modifiers.append(.shift) }
    if flags.contains(.maskControl) { modifiers.append(.control) }
    if flags.contains(.maskAlternate) { modifiers.append(.option) }
    if flags.contains(.maskCommand) { modifiers.append(.command) }
    if flags.contains(.maskAlphaShift) { modifiers.append(.capsLock) }
    if flags.contains(.maskSecondaryFn) && !isSpecialKey { modifiers.append(.function) }

    return modifiers
  }

  public var cgModifierFlags: CGEventFlags {
    switch self {
    case .clear:    .init(rawValue: 0)
    case .shift:    .maskShift
    case .control:  .maskControl
    case .option:   .maskAlternate
    case .command:  .maskCommand
    case .function: .maskSecondaryFn
    case .capsLock: .maskAlphaShift
    }
  }

  public var modifierFlags: NSEvent.ModifierFlags {
    switch self {
    case .clear: NSEvent.ModifierFlags(rawValue: 0)
    case .shift: .shift
    case .control: .control
    case .option: .option
    case .command: .command
    case .function: .function
    case .capsLock: .capsLock
    }
  }
}
