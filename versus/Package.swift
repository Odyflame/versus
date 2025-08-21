// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Versus",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .executable(
            name: "VersusApp",
            targets: ["VersusApp"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.0.0")
    ],
    targets: [
        .executableTarget(
            name: "VersusApp",
            dependencies: [
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseRemoteConfig", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk")
            ],
            path: "Sources/Versus",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "VersusTests",
            dependencies: ["VersusApp"]
        ),
    ]
)
