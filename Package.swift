// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CarrrdsUtils",
    platforms: [
        .iOS(.v17), .macOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CarrrdsUtils",
            targets: ["CarrrdsUtils"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/rebeloper/FirestoreCollection.git", from: Version(1, 0, 0)),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: Version(11, 8, 0))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CarrrdsUtils",
            dependencies: [
                .product(name: "FirestoreCollection", package: "firestorecollection"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk")
            ]),
    ]
)
