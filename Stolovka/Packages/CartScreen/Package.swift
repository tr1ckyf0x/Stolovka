// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CartScreen",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CartScreen",
            targets: ["CartScreen"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../SharedResources"),
        .package(path: "../Managers"),
        .package(path: "../Models"),
        .package(path: "../ShoppingCartUseCase"),
        .package(path: "../UseCase"),
        .package(path: "../UIComponents"),
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.0.1"),
        .package(url: "https://github.com/Quick/Nimble", from: "9.2.0"),
        .package(url: "https://github.com/Quick/Quick", from: "4.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CartScreen",
            dependencies: [
                "SharedResources",
                "Managers",
                "Models",
                "SnapKit",
                "ShoppingCartUseCase",
                "UIComponents"
            ]
        ),
        .testTarget(
            name: "CartScreenTests",
            dependencies: [
                .product(name: "UseCaseMock", package: "UseCase"),
                "CartScreen",
                "Nimble",
                "Quick"
            ]
        )
    ]
)
