// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FHKInjections",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FHKInjections",
            targets: ["FHKInjections"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/leonodev/fintechKids-modulo-core-ios.git",
                 branch: "main"),
        
            .package(url: "https://github.com/leonodev/fintechKids-modulo-storage-ios.git",
                 branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FHKInjections",
            dependencies: [
                // Modules Firebase
                .product(name: "FHKCore", package: "fintechKids-modulo-core-ios"),
                .product(name: "FHKStorage", package: "fintechKids-modulo-storage-ios")
            ]
        ),
        .testTarget(
            name: "FHKInjectionsTests",
            dependencies: ["FHKInjections"]
        ),
    ]
)
