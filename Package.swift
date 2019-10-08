// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "PullToDismiss",
    path: "Sources/",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "PullToDismiss", targets: ["PullToDismiss", "PullToDismissTests"])
    ],
    targets: [
        .target(name: "PullToDismiss"),
        .testTarget(name: "PullToDismissTests")
    ]
)
