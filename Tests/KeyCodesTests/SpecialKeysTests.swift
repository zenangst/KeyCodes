import Carbon
import KeyCodes
import Testing

@Test("Special Keys", .tags(.keyCodes), arguments: InputSourceIdentifier.allCases)
@MainActor func specialKeys(_ identifier: InputSourceIdentifier) throws {
  let keyCodes = KeyCodes()
  let inputManager = try InputSourceManager(identifier)
  let input = inputManager.selectedInputSource

  #expect(try keyCodes.value(for: kVK_Space, modifiers: [], from: input.source).displayValue == "Space")
  #expect(try keyCodes.value(for: kVK_Delete, modifiers: [], from: input.source).displayValue == "⌫")
  #expect(try keyCodes.value(for: kVK_ForwardDelete, modifiers: [], from: input.source).displayValue == "⌦")
  #expect(try keyCodes.value(for: kVK_LeftArrow, modifiers: [], from: input.source).displayValue == "←")
  #expect(try keyCodes.value(for: kVK_RightArrow, modifiers: [], from: input.source).displayValue == "→")
  #expect(try keyCodes.value(for: kVK_UpArrow, modifiers: [], from: input.source).displayValue == "↑")
  #expect(try keyCodes.value(for: kVK_DownArrow, modifiers: [], from: input.source).displayValue == "↓")
  #expect(try keyCodes.value(for: kVK_End, modifiers: [], from: input.source).displayValue == "↘")
  #expect(try keyCodes.value(for: kVK_Home, modifiers: [], from: input.source).displayValue == "↖")
  #expect(try keyCodes.value(for: kVK_Escape, modifiers: [], from: input.source).displayValue == "⎋")
  #expect(try keyCodes.value(for: kVK_PageDown, modifiers: [], from: input.source).displayValue == "⇟")
  #expect(try keyCodes.value(for: kVK_PageUp, modifiers: [], from: input.source).displayValue == "⇞")
  #expect(try keyCodes.value(for: kVK_Return, modifiers: [], from: input.source).displayValue == "↩")
  #expect(try keyCodes.value(for: kVK_ANSI_KeypadEnter, modifiers: [], from: input.source).displayValue == "⌅")
  #expect(try keyCodes.value(for: kVK_Tab, modifiers: [], from: input.source).displayValue == "⇥")
  #expect(try keyCodes.value(for: kVK_Help, modifiers: [], from: input.source).displayValue == "?⃝")
}
