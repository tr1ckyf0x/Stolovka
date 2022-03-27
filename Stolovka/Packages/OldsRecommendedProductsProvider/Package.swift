// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OldsRecommendedProductsProvider",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "OldsRecommendedProductsProvider",
            targets: ["OldsRecommendedProductsProvider"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject", from: "2.8.0"),
        .package(path: "../ProductModels")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "OldsRecommendedProductsProvider",
            dependencies: [
                "Swinject",
                "ProductModels"
            ]
        )
    ]
)
