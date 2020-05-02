// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "appleMusicTokenGenerator",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(name: "SwiftJWT", url: "https://github.com/IBM-Swift/Swift-JWT", from: "3.6.1"),
         .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "appleMusicTokenGenerator",
            dependencies: [
//                .product(name: "JWTDecode", package: "JWTDecode.swift"),
                "SwiftJWT",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]),
        .testTarget(
            name: "appleMusicTokenGeneratorTests",
            dependencies: ["appleMusicTokenGenerator"]),
    ]
)
