public struct VirtualKeyContainer {
  private let storage: [VirtualKey]

  internal init(_ storage: [VirtualKey]) {
    self.storage = storage
  }

  public func valueForKeyCode(_ keyCode: Int, modifier: VirtualModifierKey = .clear) -> VirtualKey? {
    valueForKeyCode(keyCode, modifiers: [modifier])
  }

  public func valueForKeyCode(_ keyCode: Int, modifiers: [VirtualModifierKey] = [.clear]) -> VirtualKey? {
    storage.first(where: { $0.keyCode == keyCode && $0.modifiers == modifiers })
  }

  public func valueForString(_ string: String, modifier: VirtualModifierKey = .clear) -> VirtualKey? {
    valueForString(string, modifiers: [modifier])
  }

  public func valueForString(_ string: String, modifiers: [VirtualModifierKey] = [.clear]) -> VirtualKey? {
    storage.first(where: { $0.rawValue == string && $0.modifiers == modifiers })
  }
}
