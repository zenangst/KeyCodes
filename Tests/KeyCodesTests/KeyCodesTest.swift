import Carbon
import XCTest
import KeyCodes
import InputSources

final class KeyCodesTest: XCTestCase {
  func testMappingRawValueA() throws  {
    let keyCodes = KeyCodes()
    let input = try InputSourceController().currentInputSource()

    let smallA = try keyCodes.value(for: 0, modifier: .clear, from: input.source)
    let largeA = try keyCodes.value(for: 0, modifier: .shift, from: input.source)
    let appleSymbol = try keyCodes.value(for: 0, modifier: .option, from: input.source)
    let diamond = try keyCodes.value(for: 0, modifier: .shiftOption, from: input.source)

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
    let result = try await keyCodes.mapKeyCodes(from: input.source)

    XCTAssertEqual(result.value(for: 0, modifier: .clear)?.rawValue, "a")
    XCTAssertEqual(result.value(for: 0, modifier: .shift)?.rawValue, "A")

    XCTAssertEqual(result.value(for: "a")?.keyCode, 0)
    XCTAssertEqual(result.value(for: "a")?.modifier, .clear)

    XCTAssertEqual(result.value(for: "A", modifier: .shift)?.keyCode, 0)
    XCTAssertEqual(result.value(for: "A", modifier: .shift)?.modifier, .shift)
  }
}
