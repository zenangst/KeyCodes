// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "KeyCodes",
    platforms: [.macOS(.v12)],
    products: [
        .library(name: "KeyCodes", targets: ["KeyCodes"]),
    ],
    dependencies: [
      .package(url: "https://github.com/zenangst/InputSources", exact: "1.0.0")
    ],
    targets: [
        .target(
            name: "KeyCodes",
            dependencies: []),
        .testTarget(
            name: "KeyCodesTests",
            dependencies: ["KeyCodes", "InputSources"]),
    ]
)

