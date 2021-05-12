// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TwentyLayout",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "TwentyLayout",
            targets: ["TwentyLayout"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TwentyLayout",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "TwentyLayoutTests",
            dependencies: ["TwentyLayout"]
        ),
    ]
)
