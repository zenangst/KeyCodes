import Carbon
import KeyCodes
import Testing

@Test("Space key (keyCode, displayValue, rawValue)", .tags(.keyCodes), arguments: InputSourceIdentifier.allCases)
@MainActor func spaceKey(_ identifier: InputSourceIdentifier) throws {
  let keyCodes = KeyCodes()
  let inputManager = try InputSourceManager(identifier)
  let input = inputManager.selectedInputSource

  let spaceKey = try keyCodes.value(for: kVK_Space, modifiers: [], from: input.source)

  #expect(spaceKey.keyCode == 49)
  #expect(spaceKey.displayValue == "Space")
  #expect(spaceKey.rawValue == " ")
}

