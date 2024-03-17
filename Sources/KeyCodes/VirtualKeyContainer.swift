public struct VirtualKeyContainer {
  typealias Storage = [String: VirtualKey]
  private let storage: Storage

  internal init(_ storage: Storage) {
    self.storage = storage
  }

  public func valueForKeyCode(_ keyCode: Int, modifier: VirtualModifierKey?) -> VirtualKey? {
    if let modifier = modifier {
      return valueForKeyCode(keyCode, modifiers: [modifier])
    } else {
      return valueForKeyCode(keyCode, modifiers: [])
    }
  }

  public func valueForKeyCode(_ keyCode: Int, modifiers: [VirtualModifierKey] = []) -> VirtualKey? {
    return storage[keyCode.withModifiers(modifiers).prefix(.keyCode)]
  }

  public func valueForString(_ string: String, modifier: VirtualModifierKey? = nil, matchDisplayValue: Bool) -> VirtualKey? {
    if let modifier {
      return valueForString(string, modifiers: [modifier], matchDisplayValue: matchDisplayValue)
    } else {
      return valueForString(string, modifiers: [], matchDisplayValue: matchDisplayValue)
    }
  }

  public func valueForString(_ string: String, modifiers: [VirtualModifierKey], matchDisplayValue: Bool) -> VirtualKey? {
    let displayValueKey = string.withModifiers(modifiers).prefix(.displayValue)
    let rawValueKey = string.withModifiers(modifiers).prefix(.rawValue)

    if matchDisplayValue {
      return storage[displayValueKey]
    } else {
      return storage[rawValueKey]
    }
  }
}

extension Int {
  func withModifiers(_ modifiers: [VirtualModifierKey]) -> String {
    String(self).withModifiers(modifiers)
  }
}

extension String {
  func withModifiers(_ modifiers: [VirtualModifierKey]) -> String {
    "\(self)\(modifiers.keyValue)"
  }

  func prefix(_ keySuffix: KeyPrefix) -> String {
    keySuffix.rawValue + ":" + self
  }
}

enum KeyPrefix: String, CaseIterable {
  case rawValue
  case displayValue
  case keyCode
}

private extension Collection where Element == VirtualModifierKey {
  var keyValue: String { map(\.rawValue).joined() }
}
