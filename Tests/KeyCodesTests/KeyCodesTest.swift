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
    let controller = InputSourceController()
    let identifier = InputSourceIdentifier.swedish.rawValue
    let identifierIsInstalled = controller.isInstalled(id: identifier)

    if !identifierIsInstalled { try controller.install(identifier) }

    let input = try controller.select(identifier)

    XCTAssertEqual("a", try keyCodes.value(for: 0, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("A", try keyCodes.value(for: 0, modifiers: [.leftShift], from: input.source).displayValue)
    XCTAssertEqual("A", try keyCodes.value(for: 0, modifiers: [.rightShift], from: input.source).displayValue)
    XCTAssertEqual("", try keyCodes.value(for: 0, modifiers: [.leftOption], from: input.source).displayValue)
    XCTAssertEqual("", try keyCodes.value(for: 0, modifiers: [.rightOption], from: input.source).displayValue)
    XCTAssertEqual("◊", try keyCodes.value(for: 0, modifiers: [.leftShift, .leftOption], from: input.source).displayValue)
    XCTAssertEqual("◊", try keyCodes.value(for: 0, modifiers: [.leftShift, .rightOption], from: input.source).displayValue)
  }

  func testMappingDash() throws {
    let keyCodes = KeyCodes()
    let input = try InputSourceController().currentInputSource()
    let dash = try keyCodes.value(for: 44, modifiers: [], from: input.source)
    let underscore = try keyCodes.value(for: 44, modifiers: [.leftShift], from: input.source)

    XCTAssertEqual("-", dash.rawValue)
    XCTAssertEqual("_", underscore.displayValue)
  }

  func testValueForSpaceKey() throws {
    let keyCodes = KeyCodes()
    let input = try InputSourceController().currentInputSource()
    let space = try keyCodes.value(for: kVK_Space, modifiers: [], from: input.source)

    XCTAssertEqual(" ", space.rawValue)
    XCTAssertEqual("Space", space.displayValue)
  }

  func testMapKeyCodesFromInputSource() async throws {
    let keyCodes = KeyCodes()
    let controller = InputSourceController()
    let identifier = InputSourceIdentifier.swedish.rawValue
    let identifierIsInstalled = controller.isInstalled(id: identifier)

    if !identifierIsInstalled { try controller.install(identifier) }

    let input = try controller.select(identifier)
    let result = try keyCodes.mapKeyCodes(from: input.source)

    XCTAssertEqual(result.valueForKeyCode(0, modifiers: [])?.rawValue, "a")
    XCTAssertEqual(result.valueForKeyCode(0, modifiers: [.leftShift])?.rawValue, "A")
    XCTAssertEqual(result.valueForKeyCode(0, modifiers: [.leftShift])?.displayValue, "A")

    XCTAssertEqual(result.valueForString("a", modifiers: [], matchDisplayValue: true)?.keyCode, 0)
    XCTAssertEqual(result.valueForString("a", modifiers: [], matchDisplayValue: true)?.modifiers, [])

    XCTAssertEqual(result.valueForString("A", modifiers: [.leftShift], matchDisplayValue: true)?.keyCode, 0)
    XCTAssertEqual(result.valueForString("A", modifiers: [.leftShift], matchDisplayValue: true)?.modifiers, [.leftShift])

    XCTAssertEqual(result.valueForString("-", modifiers: [], matchDisplayValue: true)?.keyCode, 44)
    XCTAssertEqual(result.valueForString("-", modifiers: [.numpad], matchDisplayValue: true)?.keyCode, 44)
    XCTAssertEqual(result.valueForString("-", modifiers: [.leftShift], matchDisplayValue: true)?.keyCode, 78)
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
    XCTAssertEqual("a", try keyCodes.value(for: 0, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("b", try keyCodes.value(for: 11, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("c", try keyCodes.value(for: 8, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("d", try keyCodes.value(for: 2, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("e", try keyCodes.value(for: 14, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("f", try keyCodes.value(for: 3, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("g", try keyCodes.value(for: 5, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("h", try keyCodes.value(for: 4, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("i", try keyCodes.value(for: 34, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("j", try keyCodes.value(for: 38, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("k", try keyCodes.value(for: 40, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("l", try keyCodes.value(for: 37, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("m", try keyCodes.value(for: 46, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("n", try keyCodes.value(for: 45, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("o", try keyCodes.value(for: 31, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("p", try keyCodes.value(for: 35, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("q", try keyCodes.value(for: 12, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("r", try keyCodes.value(for: 15, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("s", try keyCodes.value(for: 1, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("t", try keyCodes.value(for: 17, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("u", try keyCodes.value(for: 32, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("v", try keyCodes.value(for: 9, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("w", try keyCodes.value(for: 13, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("x", try keyCodes.value(for: 7, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("y", try keyCodes.value(for: 16, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("z", try keyCodes.value(for: 6, modifiers: [], from: input.source).displayValue)
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
    XCTAssertEqual("a", try keyCodes.value(for: 0, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("b", try keyCodes.value(for: 11, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("c", try keyCodes.value(for: 8, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("d", try keyCodes.value(for: 2, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("e", try keyCodes.value(for: 14, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("f", try keyCodes.value(for: 3, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("g", try keyCodes.value(for: 5, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("h", try keyCodes.value(for: 4, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("i", try keyCodes.value(for: 34, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("j", try keyCodes.value(for: 38, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("k", try keyCodes.value(for: 40, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("l", try keyCodes.value(for: 37, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("m", try keyCodes.value(for: 46, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("n", try keyCodes.value(for: 45, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("o", try keyCodes.value(for: 31, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("p", try keyCodes.value(for: 35, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("q", try keyCodes.value(for: 12, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("r", try keyCodes.value(for: 15, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("s", try keyCodes.value(for: 1, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("t", try keyCodes.value(for: 17, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("u", try keyCodes.value(for: 32, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("v", try keyCodes.value(for: 9, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("w", try keyCodes.value(for: 13, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("x", try keyCodes.value(for: 7, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("y", try keyCodes.value(for: 16, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("z", try keyCodes.value(for: 6, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("§", try keyCodes.value(for: 10, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("¨", try keyCodes.value(for: 30, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("´", try keyCodes.value(for: 24, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("ä", try keyCodes.value(for: 39, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("å", try keyCodes.value(for: 33, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("ö", try keyCodes.value(for: 41, modifiers: [], from: input.source).displayValue)

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
    XCTAssertEqual("a", try keyCodes.value(for: 0, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("b", try keyCodes.value(for: 11, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("c", try keyCodes.value(for: 8, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("d", try keyCodes.value(for: 2, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("e", try keyCodes.value(for: 14, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("f", try keyCodes.value(for: 3, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("g", try keyCodes.value(for: 5, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("h", try keyCodes.value(for: 4, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("i", try keyCodes.value(for: 34, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("j", try keyCodes.value(for: 38, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("k", try keyCodes.value(for: 40, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("l", try keyCodes.value(for: 37, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("m", try keyCodes.value(for: 46, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("n", try keyCodes.value(for: 45, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("o", try keyCodes.value(for: 31, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("p", try keyCodes.value(for: 35, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("q", try keyCodes.value(for: 12, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("r", try keyCodes.value(for: 15, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("s", try keyCodes.value(for: 1, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("t", try keyCodes.value(for: 17, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("u", try keyCodes.value(for: 32, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("v", try keyCodes.value(for: 9, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("w", try keyCodes.value(for: 13, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("x", try keyCodes.value(for: 7, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("y", try keyCodes.value(for: 16, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("z", try keyCodes.value(for: 6, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("'", try keyCodes.value(for: 10, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("¨", try keyCodes.value(for: 30, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("´", try keyCodes.value(for: 24, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("æ", try keyCodes.value(for: 39, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("å", try keyCodes.value(for: 33, modifiers: [], from: input.source).displayValue)
    XCTAssertEqual("ø", try keyCodes.value(for: 41, modifiers: [], from: input.source).displayValue)

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
