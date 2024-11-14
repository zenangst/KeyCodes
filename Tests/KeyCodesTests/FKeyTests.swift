import Carbon
import KeyCodes
import InputSources
import Testing

fileprivate let tests: [Test] = InputSourceIdentifier.allCases.flatMap { keyboardLayout in
  [
    Test(that: kVK_F1, hasDisplayValue: "F1", on: keyboardLayout),
    Test(that: kVK_F2, hasDisplayValue: "F2", on: keyboardLayout),
    Test(that: kVK_F3, hasDisplayValue: "F3", on: keyboardLayout),
    Test(that: kVK_F4, hasDisplayValue: "F4", on: keyboardLayout),
    Test(that: kVK_F5, hasDisplayValue: "F5", on: keyboardLayout),
    Test(that: kVK_F6, hasDisplayValue: "F6", on: keyboardLayout),
    Test(that: kVK_F7, hasDisplayValue: "F7", on: keyboardLayout),
    Test(that: kVK_F8, hasDisplayValue: "F8", on: keyboardLayout),
    Test(that: kVK_F9, hasDisplayValue: "F9", on: keyboardLayout),
    Test(that: kVK_F10, hasDisplayValue: "F10", on: keyboardLayout),
    Test(that: kVK_F11, hasDisplayValue: "F11", on: keyboardLayout),
    Test(that: kVK_F12, hasDisplayValue: "F12", on: keyboardLayout),
    Test(that: kVK_F13, hasDisplayValue: "F13", on: keyboardLayout),
    Test(that: kVK_F14, hasDisplayValue: "F14", on: keyboardLayout),
    Test(that: kVK_F15, hasDisplayValue: "F15", on: keyboardLayout),
    Test(that: kVK_F16, hasDisplayValue: "F16", on: keyboardLayout),
    Test(that: kVK_F17, hasDisplayValue: "F17", on: keyboardLayout),
    Test(that: kVK_F18, hasDisplayValue: "F18", on: keyboardLayout),
    Test(that: kVK_F19, hasDisplayValue: "F19", on: keyboardLayout),
    Test(that: kVK_F20, hasDisplayValue: "F20", on: keyboardLayout),
  ]
}

@Test("Mapping F-keys", .tags(.keyCodes), arguments: tests)
@MainActor private func fKeys(_ test: Test) throws {
  let keyCodes = KeyCodes()
  let inputManager = try InputSourceManager(test.identifier)
  let input = inputManager.selectedInputSource
  let virtualKey = try keyCodes.value(for: test.keyCode, modifiers: test.modifiers, from: input.source)

  #expect(virtualKey.keyCode == test.keyCode)
  #expect(virtualKey.displayValue == test.expectedDisplayValue)
//  #expect(virtualKey.rawValue == test.expectedRawValue) // Verify if we should give back display value if the raw value can't be represented.
  #expect(virtualKey.modifiers == test.modifiers)
}

fileprivate struct Test {
  let identifier: InputSourceIdentifier
  let keyCode: Int
  let expectedDisplayValue: String
  let expectedRawValue: String
  let modifiers: [VirtualModifierKey]

  init(that keyCode: Int, hasDisplayValue displayValue: String,
       rawValue: String = "", withModifiers modifiers: [VirtualModifierKey] = [],
       on identifier: InputSourceIdentifier) {
    self.identifier = identifier
    self.keyCode = keyCode
    self.expectedDisplayValue = displayValue
    self.modifiers = modifiers
    self.expectedRawValue = rawValue
  }
}
