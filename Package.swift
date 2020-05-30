// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "licenses",
    products: [
        .executable(
            name: "licenses",
            targets: ["licenses-tool", ]
        ),
        .library(
            name: "Licenses",
            targets: ["Licenses"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/Yams", from: "3.0.0"),
        .package(url: "https://github.com/kylef/PathKit", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "0.0.1")),
    ],
    targets: [
        .target(
            name: "licenses-tool",
            dependencies: [
                "Licenses", 
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .target(
            name: "Licenses",
            dependencies: ["Yams", "PathKit"]
        ),
        .testTarget(
            name: "LicensesTests",
            dependencies: ["Licenses"]
        ),
    ]
)
