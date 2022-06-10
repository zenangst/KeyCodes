import Carbon

public struct VirtualKey {
  public let displayValue: String
  public let keyCode: Int
  public let modifiers: [VirtualModifierKey]
  public let rawValue: String

  internal init(keyCode: Int, rawValue: String, modifiers: [VirtualModifierKey], displayValue: String) {
    self.keyCode = keyCode
    self.rawValue = rawValue
    self.modifiers = modifiers
    self.displayValue = displayValue
  }
}
