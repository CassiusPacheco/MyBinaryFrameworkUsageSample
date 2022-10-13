// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyBinaryFrameworkUsage",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "MyBinaryFrameworkUsage",
            targets: ["MyBinaryFrameworkUsageTarget"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/square/Valet.git", from: "4.1.2"),
    ],
    targets: [
        .target(
            name: "MyBinaryFrameworkUsageTarget",
            dependencies: [
                .target(name: "MyBinaryFrameworkWrapper")
            ]
        ),
        .target(
            name: "MyBinaryFrameworkWrapper",
            dependencies: [
                .target(name: "MyBinaryFramework"),
                .product(name: "Valet", package: "Valet"),
            ],
            path: "MyBinaryFrameworkWrapper",
            linkerSettings: [
                .linkedFramework("Security"),
                .linkedFramework("Foundation")
            ]
        ),
        // binary built using stack evolution https://github.com/unsignedapps/swift-create-xcframework/blob/main/Sources/CreateXCFramework/XcodeBuilder.swift#L126
        .binaryTarget(
            name: "MyBinaryFramework",
            url: "https://github.com/CassiusPacheco/MyBinaryFramework/releases/download/v0.0.1/MyBinaryFramework-stack.zip",
            checksum: "f92a96bde1656d6a10fad511d99f34adcc115bb8cba6f9de640c5cb9f8ab1dea"
        ),
        // same code as above, but binary without stack evolution
//        .binaryTarget(
//            name: "MyBinaryFramework",
//            url: "https://github.com/CassiusPacheco/MyBinaryFramework/releases/download/v0.0.1/MyBinaryFramework.zip",
//            checksum: "4569d72836bafbe0dc069a5d18af99f9b0bbbf8cf31be552330c79a6d67012fd"
//        ),
//        .binaryTarget(name: "MyBinaryFramework", path: "MyBinaryFramework.xcframework")
    ]
)
