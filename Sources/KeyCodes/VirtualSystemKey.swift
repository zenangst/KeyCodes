import Carbon.HIToolbox

internal struct VirtualSystemKey {
  let keyCode: Int
  let carbonModifiers: Int
  let isEnabled: Bool

  internal init?(_ dictionary: [String: Any]) {
    guard let keyCode = dictionary[kHISymbolicHotKeyCode] as? Int else { return nil }
    guard let carbonModifiers = dictionary[kHISymbolicHotKeyModifiers] as? Int else { return nil }
    self.keyCode = keyCode
    self.carbonModifiers = carbonModifiers
    self.isEnabled = (dictionary[kHISymbolicHotKeyEnabled] as? Bool) ?? false
  }
}
