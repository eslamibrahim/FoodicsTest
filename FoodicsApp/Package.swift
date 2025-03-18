// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FoodicsApp",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .macOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FoodicsApp",
            targets: [
                "FoodicsApp",
            ]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/onevcat/Kingfisher.git",
            branch: "7.6.1"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FoodicsApp",
            dependencies: [
                "NetworkLayer",
                "AppFlow",
                ]),
        
        .target(
            name: "NetworkLayer"),
        
        .target(
            name: "AppFlow",
            dependencies: [
                "NetworkLayer",
                "Kingfisher"
            ]),
        
        .testTarget(
            name: "FoodicsAppTests",
            dependencies: ["FoodicsApp"]
        ),
    ]
)
