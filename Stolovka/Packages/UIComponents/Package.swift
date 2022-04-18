// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIComponents",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "UIComponents",
            targets: ["UIComponents"]
        )
    ],
    dependencies: [
        .package(path: "../SharedResources"),
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.0.1"),
        .package(url: "https://github.com/Quick/Nimble", from: "9.2.0"),
        .package(url: "https://github.com/Quick/Quick", from: "4.0.0")
    ],
    targets: [
        .target(
            name: "UIComponents",
            dependencies: [
                "SharedResources",
                "SnapKit"
            ]
        ),
        .testTarget(
            name: "UIComponentsTests",
            dependencies: [
                "UIComponents",
                "Nimble",
                "Quick"
            ]
        )
    ]
)
