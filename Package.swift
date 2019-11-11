// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Constrictor",
    platforms: [
       .iOS(.v11),
    ],
    products: [
        .library(
            name: "Constrictor",
            targets: ["Constrictor"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Constrictor",
            dependencies: [],
            path: "Constrictor/Constrictor"),
    ]
)
