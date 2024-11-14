import Foundation
import InputSources
import KeyCodes
import Testing

@Test("Generate Tests", .disabled(), arguments: InputSourceIdentifier.allCases)
@MainActor func generate(identifier: InputSourceIdentifier) throws {
  let folder = URL(filePath: "\(#filePath)")
    .deletingLastPathComponent()
    .appending(path: "Layouts/")
  let filename = "\(identifier)Tests.swift".capitalizedFirstLetter()
  let destination = folder.appendingPathComponent(filename)

  var isDirectory = ObjCBool(true)
  if !FileManager.default.fileExists(atPath: folder.path(), isDirectory: &isDirectory) {
    try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
  }

  if FileManager.default.fileExists(atPath: destination.path) {
    try FileManager.default.removeItem(at: destination)
  }

var contents = """
/// Layout: \(identifier.rawValue) (\(identifier))")
/// ---------------------------------------------
import KeyCodes
import InputSources
import Testing

fileprivate let tests = [

"""

  for x in 0...128 {
    let inputManager = try InputSourceManager(identifier)
    let keyCodes = KeyCodes()
    let noModifier = try keyCodes.value(for: x, modifiers: [], from: inputManager.selectedInputSource.source)
    let shift = try keyCodes.value(for: x, modifiers: [.leftShift], from: inputManager.selectedInputSource.source)
    let option = try keyCodes.value(for: x, modifiers: [.leftOption], from: inputManager.selectedInputSource.source)
    let shiftAndOption = try keyCodes.value(for: x, modifiers: [.leftShift, .leftOption], from: inputManager.selectedInputSource.source)

    guard noModifier.displayValue.trimmingCharacters(in: .controlCharacters).count > 0 else { continue }

    contents += """
Test(that: \(x), isEqualTo: "\(noModifier.escapedDisplayValue)", on: .\(identifier)),
Test(that: \(x), withModifiers: [.leftShift], isEqualTo: "\(shift.escapedDisplayValue)", on: .\(identifier)),
Test(that: \(x), withModifiers: [.leftOption], isEqualTo: "\(option.escapedDisplayValue)", on: .\(identifier)),
Test(that: \(x), withModifiers: [.leftShift, .leftOption], isEqualTo: "\(shiftAndOption.escapedDisplayValue)", on: .\(identifier)),
/// --------------------------------------------- 

"""
  }
contents += """
]

@Test("\(identifier.rawValue)", .tags(.keyCodes), arguments: tests)
@MainActor private func \(identifier)(_ test: Test) async throws {
  let keyCodes = KeyCodes()
  let inputManager = try InputSourceManager(test.identifier)
  let input = inputManager.selectedInputSource
  let result = try keyCodes.value(for: test.data.keyCode,
                                  modifiers: test.data.modifiers,
                                  from: input.source).displayValue
  #expect(result == test.data.expected)
}

private struct Test {
  let identifier: InputSourceIdentifier
  let data: Data

  init(that keyCode: Int, withModifiers modifiers: [VirtualModifierKey] = [],
       isEqualTo expected: String, on identifier: InputSourceIdentifier) {
    let data = Data(keyCode, expected: expected, modifiers: modifiers)
    self.identifier = identifier
    self.data = data
  }
}

private struct Data {
  let keyCode: Int
  let expected: String
  let modifiers: [VirtualModifierKey]

  init(_ keyCode: Int, expected: String, modifiers: [VirtualModifierKey]) {
    self.keyCode = keyCode
    self.expected = expected
    self.modifiers = modifiers
  }
}
"""
  let data = contents.data(using: .utf8)
  FileManager.default.createFile(atPath: destination.path, contents: data, attributes: nil)
}

private extension VirtualKey {
  var escapedDisplayValue: String {
    if displayValue == "\"" { return "\\" + displayValue }
    if displayValue == "\\" { return "\\" + displayValue }
    return displayValue
  }
}

extension String {
  var isStringPrintable: Bool {
    for scalar in self.unicodeScalars {
      if !scalar.properties.isAlphabetic {
        return false
      }
    }
    return true
  }
}

extension String {
  func capitalizedFirstLetter() -> String {
    guard let first = self.first else { return self }
    return first.uppercased() + self.dropFirst()
  }

  mutating func capitalizeFirstLetter() {
    self = self.capitalizedFirstLetter()
  }
}
