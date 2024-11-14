import InputSources

final class InputSourceManager {
  let selectedInputSource: InputSource

  private let currentInputSource: InputSource
  private let identifier: InputSourceIdentifier
  private let installed: Bool
  private let controller: InputSourceController

  init(_ identifier: InputSourceIdentifier) throws {
    self.identifier = identifier
    self.controller = InputSourceController()
    self.currentInputSource = try controller.currentInputSource()
    self.installed = controller.isInstalled(id: identifier.rawValue)

    if !installed {
      try controller.install(identifier.rawValue)
    }

    self.selectedInputSource = try controller.select(identifier.rawValue)
  }

  deinit {
    if !installed {
      try? controller.uninstall(identifier.rawValue)
    }
    _ = try? controller.select(currentInputSource)
  }
}
