// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "DirectoryObserver",
    products: [
        .library(name: "DirectoryObserver", targets: ["DirectoryObserver"]),
    ],
    targets: [
        .target(
            name: "DirectoryObserver",
            dependencies: []),
        .testTarget(
            name: "DirectoryObserverTests",
            dependencies: ["DirectoryObserver"]),
    ]
)
