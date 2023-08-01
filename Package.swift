// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CSAlgorithm",
    platforms: [
        .macOS(.v12),
//        .iOS(.v11)
    ],
    products: [
        .library(name: "CSAlgorithm", targets: ["CSAlgorithm"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CSAlgorithm",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "CSAlgorithmTests",
            dependencies: ["CSAlgorithm"],
            path: "Tests"
        ),
        .testTarget(
            name: "LeetCodeTests",
            dependencies: ["CSAlgorithm"],
            path: "LeetCode"
        ),
    ]
)
