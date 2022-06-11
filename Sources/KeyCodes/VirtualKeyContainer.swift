public struct VirtualKeyContainer {
  private let storage: [VirtualKey]

  internal init(_ storage: [VirtualKey]) {
    self.storage = storage
  }

  public func valueForKeyCode(_ keyCode: Int, modifier: VirtualModifierKey? = nil) -> VirtualKey? {
    if let modifier = modifier {
      return valueForKeyCode(keyCode, modifiers: [modifier])
    } else {
      return valueForKeyCode(keyCode, modifiers: [])
    }
  }

  public func valueForKeyCode(_ keyCode: Int, modifiers: [VirtualModifierKey]) -> VirtualKey? {
    if modifiers.isEmpty {
      return storage.first(where: { $0.keyCode == keyCode })
    } else {
      return storage.first(where: { $0.keyCode == keyCode && $0.modifiers == modifiers })
    }
  }

  public func valueForString(_ string: String, modifier: VirtualModifierKey? = nil, matchDisplayValue: Bool) -> VirtualKey? {
    if let modifier = modifier {
      return valueForString(string, modifiers: [modifier], matchDisplayValue: matchDisplayValue)
    } else {
      return valueForString(string, modifiers: [], matchDisplayValue: matchDisplayValue)
    }
  }

  public func valueForString(_ string: String, modifiers: [VirtualModifierKey], matchDisplayValue: Bool) -> VirtualKey? {
    let stringMatcher: (VirtualKey) -> Bool
    if matchDisplayValue {
      stringMatcher = { $0.rawValue == string || $0.displayValue == string }
    } else {
      stringMatcher = { $0.rawValue == string }
    }

    if modifiers.isEmpty {
      return storage.first(where: stringMatcher)
    } else {
      return storage.first(where: { stringMatcher($0) && $0.modifiers == modifiers })
    }
  }
}
