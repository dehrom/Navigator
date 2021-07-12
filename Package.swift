// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Navigator",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "Navigator",
            targets: ["Navigator"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Navigator",
            dependencies: []),
        .testTarget(
            name: "NavigatorTests",
            dependencies: ["Navigator"]),
    ]
)
