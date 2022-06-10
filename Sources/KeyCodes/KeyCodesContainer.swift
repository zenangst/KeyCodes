public struct KeyCodesContainer {
  private let storage: [KeyCodesValue]

  internal init(_ storage: [KeyCodesValue]) {
    self.storage = storage
  }

  public func value(for keyCode: Int, modifier: KeyCodes.Modifier = .clear) -> KeyCodesValue? {
    storage.first(where: { $0.keyCode == keyCode && $0.modifier == modifier })
  }

  public func value(for string: String, modifier: KeyCodes.Modifier = .clear) -> KeyCodesValue? {
    storage.first(where: { $0.rawValue == string && $0.modifier == modifier })
  }
}
