// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Managers",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Managers",
            targets: ["Managers"]
        ),
        .library(
            name: "ManagersMock",
            targets: ["ManagersMock"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../SharedResources"),
        .package(path: "../Models"),
        .package(url: "https://github.com/Quick/Nimble", from: "9.2.0"),
        .package(url: "https://github.com/Quick/Quick", from: "4.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Managers",
            dependencies: [
                "SharedResources",
                "Models"
            ]
        ),
        .target(
            name: "ManagersMock",
            dependencies: [
                "Managers"
            ]
        ),
        .testTarget(
            name: "ManagersTests",
            dependencies: [
                "Managers",
                "Nimble",
                "Quick"
            ]
        )
    ]
)
