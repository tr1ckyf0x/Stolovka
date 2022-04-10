// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SmokersStolovka",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SmokersStolovka",
            targets: ["SmokersStolovka"]
        )
    ],
    dependencies: [
        .package(path: "../SharedResources"),
        .package(path: "../ProductModels"),
        .package(path: "../UseCase"),
        .package(path: "../Models"),
        .package(path: "../Managers"),
        .package(path: "../CartScreen"),
        .package(path: "../ShoppingCartUseCase"),
        .package(url: "https://github.com/Quick/Nimble", from: "9.2.0"),
        .package(url: "https://github.com/Quick/Quick", from: "4.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SmokersStolovka",
            dependencies: [
                "SharedResources",
                "ProductModels",
                "Models",
                "Managers",
                "CartScreen",
                "ShoppingCartUseCase",
                .product(name: "UseCase", package: "UseCase")
            ]
        ),
        .testTarget(
            name: "SmokersStolovkaTests",
            dependencies: [
                "SmokersStolovka",
                "Nimble",
                "Quick",
                .product(name: "UseCaseMock", package: "UseCase")
            ]
        )
    ]
)
