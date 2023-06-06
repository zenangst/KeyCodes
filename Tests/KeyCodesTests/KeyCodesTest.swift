import Carbon
import XCTest
import KeyCodes
import InputSources

final class KeyCodesTest: XCTestCase {
  enum InputSourceIdentifier: String {
    case abc = "com.apple.keylayout.ABC"
    case english = "com.apple.keylayout.US"
    case swedish = "com.apple.keylayout.Swedish-Pro"
    case norwegian = "com.apple.keylayout.Norwegian"
  }

  func testMappingRawValueA() throws  {
    let keyCodes = KeyCodes()
    let input = try InputSourceController().currentInputSource()

    let smallA = try keyCodes.value(for: 0, modifier: .clear, from: input.source)
    let largeA = try keyCodes.value(for: 0, modifier: .shift, from: input.source)
    let appleSymbol = try keyCodes.value(for: 0, modifier: .option, from: input.source)
    let diamond = try keyCodes.value(for: 0, modifiers: [.shift, .option], from: input.source)

    XCTAssertEqual("a", smallA.rawValue)
    XCTAssertEqual("A", largeA.rawValue)
    XCTAssertEqual("", appleSymbol.rawValue)
    XCTAssertEqual("◊", diamond.rawValue)
  }

  func testValueForSpaceKey() throws {
    let keyCodes = KeyCodes()
    let input = try InputSourceController().currentInputSource()
    let space = try keyCodes.value(for: kVK_Space, modifier: .clear, from: input.source)

    XCTAssertEqual(" ", space.rawValue)
    XCTAssertEqual("Space", space.displayValue)
  }

  func testMapKeyCodesFromInputSource() async throws {
    let keyCodes = KeyCodes()
    let input = try InputSourceController().currentInputSource()
    let result = try keyCodes.mapKeyCodes(from: input.source)

    XCTAssertEqual(result.valueForKeyCode(0, modifier: .clear)?.rawValue, "a")
    XCTAssertEqual(result.valueForKeyCode(0, modifier: .shift)?.rawValue, "A")

    XCTAssertEqual(result.valueForString("a", modifier: .clear, matchDisplayValue: true)?.keyCode, 0)
    XCTAssertEqual(result.valueForString("a", modifier: .clear, matchDisplayValue: true)?.modifiers, [.clear])

    XCTAssertEqual(result.valueForString("A", modifier: .shift, matchDisplayValue: true)?.keyCode, 0)
    XCTAssertEqual(result.valueForString("A", modifier: .shift, matchDisplayValue: true)?.modifiers, [.shift])
  }

  func testSystemKeys() throws {
    let keyCodes = KeyCodes()
    let input = try InputSourceController().currentInputSource()
    let results = try keyCodes.systemKeys(from: input.source)

    XCTAssertFalse(results.isEmpty)
  }

  func testMapperWithABCLayout() throws {
    let keyCodes = KeyCodes()
    let controller = InputSourceController()
    let identifier = InputSourceIdentifier.abc.rawValue
    let identifierIsInstalled = controller.isInstalled(id: identifier)

    if !identifierIsInstalled { try controller.install(identifier) }

    let input = try controller.select(identifier)

    XCTAssertEqual("\\", try keyCodes.value(for: 42, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("-", try keyCodes.value(for: 27, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual(",", try keyCodes.value(for: 43, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("/", try keyCodes.value(for: 44, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual(".", try keyCodes.value(for: 47, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("0", try keyCodes.value(for: 29, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("1", try keyCodes.value(for: 18, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("2", try keyCodes.value(for: 19, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("3", try keyCodes.value(for: 20, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("4", try keyCodes.value(for: 21, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("5", try keyCodes.value(for: 23, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("6", try keyCodes.value(for: 22, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("7", try keyCodes.value(for: 26, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("8", try keyCodes.value(for: 28, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("9", try keyCodes.value(for: 25, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("`", try keyCodes.value(for: 50, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("A", try keyCodes.value(for: 0, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("B", try keyCodes.value(for: 11, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("C", try keyCodes.value(for: 8, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("D", try keyCodes.value(for: 2, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("E", try keyCodes.value(for: 14, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F", try keyCodes.value(for: 3, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("G", try keyCodes.value(for: 5, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("H", try keyCodes.value(for: 4, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("I", try keyCodes.value(for: 34, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("J", try keyCodes.value(for: 38, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("K", try keyCodes.value(for: 40, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("L", try keyCodes.value(for: 37, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("M", try keyCodes.value(for: 46, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("N", try keyCodes.value(for: 45, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("O", try keyCodes.value(for: 31, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("P", try keyCodes.value(for: 35, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Q", try keyCodes.value(for: 12, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("R", try keyCodes.value(for: 15, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("S", try keyCodes.value(for: 1, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("T", try keyCodes.value(for: 17, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("U", try keyCodes.value(for: 32, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("V", try keyCodes.value(for: 9, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("W", try keyCodes.value(for: 13, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("X", try keyCodes.value(for: 7, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Y", try keyCodes.value(for: 16, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Z", try keyCodes.value(for: 6, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("§", try keyCodes.value(for: 10, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("]", try keyCodes.value(for: 30, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("=", try keyCodes.value(for: 24, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("'", try keyCodes.value(for: 39, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("[", try keyCodes.value(for: 33, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual(";", try keyCodes.value(for: 41, modifiers: [], from: input.source).displayValue)

    if !identifierIsInstalled { try controller.uninstall(identifier) }
  }

  func testMapperWithSwedishLayout() throws {
    let keyCodes = KeyCodes()
    let controller = InputSourceController()
    let identifier = InputSourceIdentifier.swedish.rawValue
    let identifierIsInstalled = controller.isInstalled(id: identifier)

    if !identifierIsInstalled { try controller.install(identifier) }

    let input = try controller.select(identifier)

    XCTAssertEqual("'", try keyCodes.value(for: 42, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("+", try keyCodes.value(for: 27, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual(",", try keyCodes.value(for: 43, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("-", try keyCodes.value(for: 44, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual(".", try keyCodes.value(for: 47, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("0", try keyCodes.value(for: 29, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("1", try keyCodes.value(for: 18, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("2", try keyCodes.value(for: 19, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("3", try keyCodes.value(for: 20, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("4", try keyCodes.value(for: 21, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("5", try keyCodes.value(for: 23, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("6", try keyCodes.value(for: 22, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("7", try keyCodes.value(for: 26, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("8", try keyCodes.value(for: 28, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("9", try keyCodes.value(for: 25, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("<", try keyCodes.value(for: 50, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("A", try keyCodes.value(for: 0, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("B", try keyCodes.value(for: 11, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("C", try keyCodes.value(for: 8, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("D", try keyCodes.value(for: 2, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("E", try keyCodes.value(for: 14, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F", try keyCodes.value(for: 3, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("G", try keyCodes.value(for: 5, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("H", try keyCodes.value(for: 4, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("I", try keyCodes.value(for: 34, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("J", try keyCodes.value(for: 38, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("K", try keyCodes.value(for: 40, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("L", try keyCodes.value(for: 37, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("M", try keyCodes.value(for: 46, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("N", try keyCodes.value(for: 45, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("O", try keyCodes.value(for: 31, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("P", try keyCodes.value(for: 35, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Q", try keyCodes.value(for: 12, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("R", try keyCodes.value(for: 15, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("S", try keyCodes.value(for: 1, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("T", try keyCodes.value(for: 17, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("U", try keyCodes.value(for: 32, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("V", try keyCodes.value(for: 9, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("W", try keyCodes.value(for: 13, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("X", try keyCodes.value(for: 7, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Y", try keyCodes.value(for: 16, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Z", try keyCodes.value(for: 6, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("§", try keyCodes.value(for: 10, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("¨", try keyCodes.value(for: 30, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("´", try keyCodes.value(for: 24, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Ä", try keyCodes.value(for: 39, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Å", try keyCodes.value(for: 33, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Ö", try keyCodes.value(for: 41, modifiers: [], from: input.source).displayValue)

    if !identifierIsInstalled { try controller.uninstall(identifier) }
  }

  func testMapperWithNorwegianLayout() throws {
    let keyCodes = KeyCodes()
    let controller = InputSourceController()
    let identifier = InputSourceIdentifier.norwegian.rawValue
    let identifierIsInstalled = controller.isInstalled(id: identifier)

    if !identifierIsInstalled { try controller.install(identifier) }

    let input = try controller.select(identifier)

    XCTAssertEqual("@", try keyCodes.value(for: 42, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("+", try keyCodes.value(for: 27, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual(",", try keyCodes.value(for: 43, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("-", try keyCodes.value(for: 44, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual(".", try keyCodes.value(for: 47, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("0", try keyCodes.value(for: 29, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("1", try keyCodes.value(for: 18, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("2", try keyCodes.value(for: 19, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("3", try keyCodes.value(for: 20, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("4", try keyCodes.value(for: 21, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("5", try keyCodes.value(for: 23, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("6", try keyCodes.value(for: 22, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("7", try keyCodes.value(for: 26, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("8", try keyCodes.value(for: 28, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("9", try keyCodes.value(for: 25, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("<", try keyCodes.value(for: 50, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("A", try keyCodes.value(for: 0, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("B", try keyCodes.value(for: 11, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("C", try keyCodes.value(for: 8, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("D", try keyCodes.value(for: 2, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("E", try keyCodes.value(for: 14, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F", try keyCodes.value(for: 3, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("G", try keyCodes.value(for: 5, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("H", try keyCodes.value(for: 4, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("I", try keyCodes.value(for: 34, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("J", try keyCodes.value(for: 38, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("K", try keyCodes.value(for: 40, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("L", try keyCodes.value(for: 37, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("M", try keyCodes.value(for: 46, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("N", try keyCodes.value(for: 45, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("O", try keyCodes.value(for: 31, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("P", try keyCodes.value(for: 35, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Q", try keyCodes.value(for: 12, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("R", try keyCodes.value(for: 15, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("S", try keyCodes.value(for: 1, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("T", try keyCodes.value(for: 17, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("U", try keyCodes.value(for: 32, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("V", try keyCodes.value(for: 9, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("W", try keyCodes.value(for: 13, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("X", try keyCodes.value(for: 7, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Y", try keyCodes.value(for: 16, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Z", try keyCodes.value(for: 6, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("'", try keyCodes.value(for: 10, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("¨", try keyCodes.value(for: 30, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("´", try keyCodes.value(for: 24, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Æ", try keyCodes.value(for: 39, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Å", try keyCodes.value(for: 33, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("Ø", try keyCodes.value(for: 41, modifiers: [], from: input.source).displayValue)

    if !identifierIsInstalled { try controller.uninstall(identifier) }
  }

  func testMappingMappingFKeys() throws {
    let keyCodes = KeyCodes()
    let controller = InputSourceController()
    let input = try controller.currentInputSource()

    XCTAssertEqual("F1", try keyCodes.value(for: kVK_F1, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F2", try keyCodes.value(for: kVK_F2, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F3", try keyCodes.value(for: kVK_F3, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F4", try keyCodes.value(for: kVK_F4, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F5", try keyCodes.value(for: kVK_F5, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F6", try keyCodes.value(for: kVK_F6, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F7", try keyCodes.value(for: kVK_F7, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F8", try keyCodes.value(for: kVK_F8, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F9", try keyCodes.value(for: kVK_F9, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F10", try keyCodes.value(for: kVK_F10, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F11", try keyCodes.value(for: kVK_F11, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F12", try keyCodes.value(for: kVK_F12, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F13", try keyCodes.value(for: kVK_F13, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F14", try keyCodes.value(for: kVK_F14, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F15", try keyCodes.value(for: kVK_F15, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F16", try keyCodes.value(for: kVK_F16, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F17", try keyCodes.value(for: kVK_F17, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F18", try keyCodes.value(for: kVK_F18, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F19", try keyCodes.value(for: kVK_F19, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("F20", try keyCodes.value(for: kVK_F20, modifiers: [], from: input.source).displayValue)
  }

  func testMappingSpecialKeys() throws {
    let keyCodes = KeyCodes()
    let controller = InputSourceController()
    let input = try controller.currentInputSource()

    XCTAssertEqual("Space", try keyCodes.value(for: kVK_Space, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("⌫", try keyCodes.value(for: kVK_Delete, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("⌦", try keyCodes.value(for: kVK_ForwardDelete, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("⌧", try keyCodes.value(for: kVK_ANSI_Keypad0, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("←", try keyCodes.value(for: kVK_LeftArrow, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("→", try keyCodes.value(for: kVK_RightArrow, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("↑", try keyCodes.value(for: kVK_UpArrow, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("↓", try keyCodes.value(for: kVK_DownArrow, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("↘", try keyCodes.value(for: kVK_End, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("↖", try keyCodes.value(for: kVK_Home, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("⎋", try keyCodes.value(for: kVK_Escape, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("⇟", try keyCodes.value(for: kVK_PageDown, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("⇞", try keyCodes.value(for: kVK_PageUp, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("↩", try keyCodes.value(for: kVK_Return, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("⌅", try keyCodes.value(for: kVK_ANSI_KeypadEnter, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("⇥", try keyCodes.value(for: kVK_Tab, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("?⃝", try keyCodes.value(for: kVK_Help, modifiers: [], from: input.source).displayValue)
  }
}
