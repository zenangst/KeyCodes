import Carbon
import Cocoa

public enum VirtualSpecialKey {
  static public let keys: [Int: String] =
    [
      kVK_F1: "F1",
      kVK_F2: "F2",
      kVK_F3: "F3",
      kVK_F4: "F4",
      kVK_F5: "F5",
      kVK_F6: "F6",
      kVK_F7: "F7",
      kVK_F8: "F8",
      kVK_F9: "F9",
      kVK_F10: "F10",
      kVK_F11: "F11",
      kVK_F12: "F12",
      kVK_F13: "F13",
      kVK_F14: "F14",
      kVK_F15: "F15",
      kVK_F16: "F16",
      kVK_F17: "F17",
      kVK_F18: "F18",
      kVK_F19: "F19",
      kVK_F20: "F20",
      kVK_Space: "Space",
      kVK_CapsLock: "Caps Lock",
      kVK_Delete: String(format: "%C", 0x232B),
      kVK_ForwardDelete: String(format: "%C", 0x2326),
      kVK_ANSI_Keypad0: String(format: "#%C", 0x0030),
      kVK_ANSI_Keypad1: String(format: "#%C", 0x0031),
      kVK_ANSI_Keypad2: String(format: "#%C", 0x0032),
      kVK_ANSI_Keypad3: String(format: "#%C", 0x0033),
      kVK_ANSI_Keypad4: String(format: "#%C", 0x0034),
      kVK_ANSI_Keypad5: String(format: "#%C", 0x0035),
      kVK_ANSI_Keypad6: String(format: "#%C", 0x0036),
      kVK_ANSI_Keypad7: String(format: "#%C", 0x0037),
      kVK_ANSI_Keypad8: String(format: "#%C", 0x0038),
      kVK_ANSI_Keypad9: String(format: "#%C", 0x0039),
      kVK_LeftArrow: String(format: "%C", 0x2190),
      kVK_RightArrow: String(format: "%C", 0x2192),
      kVK_UpArrow: String(format: "%C", 0x2191),
      kVK_DownArrow: String(format: "%C", 0x2193),
      kVK_End: String(format: "%C", 0x2198),
      kVK_Home: String(format: "%C", 0x2196),
      kVK_Escape: String(format: "%C", 0x238B),
      kVK_PageDown: String(format: "%C", 0x21DF),
      kVK_PageUp: String(format: "%C", 0x21DE),
      kVK_Return: String(format: "%C", 0x21A9),
      kVK_ANSI_KeypadEnter: String(format: "%C", 0x2305),
      kVK_Tab: String(format: "%C", 0x21E5),
      kVK_Help: "?⃝"
    ]
}
