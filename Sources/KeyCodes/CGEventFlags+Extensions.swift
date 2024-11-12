import Carbon.HIToolbox
import Cocoa

extension CGEventFlags {
  static var maskLeftShift: CGEventFlags { CGEventFlags(rawValue: UInt64(NX_DEVICELSHIFTKEYMASK)) }
  static var maskLeftControl: CGEventFlags { CGEventFlags(rawValue: UInt64(NX_DEVICELCTLKEYMASK)) }
  static var maskLeftAlternate: CGEventFlags { CGEventFlags(rawValue: UInt64(NX_DEVICELALTKEYMASK)) }
  static var maskLeftCommand: CGEventFlags { CGEventFlags(rawValue: UInt64(NX_DEVICELCMDKEYMASK)) }

  static var maskRightControl: CGEventFlags { CGEventFlags(rawValue: UInt64(NX_DEVICERCTLKEYMASK)) }
  static var maskRightShift: CGEventFlags { CGEventFlags(rawValue: UInt64(NX_DEVICERSHIFTKEYMASK)) }
  static var maskRightAlternate: CGEventFlags { CGEventFlags(rawValue: UInt64(NX_DEVICERALTKEYMASK)) }
  static var maskRightCommand: CGEventFlags { CGEventFlags(rawValue: UInt64(NX_DEVICERCMDKEYMASK)) }
}
