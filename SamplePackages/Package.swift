// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SamplePackages",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Package1Library",
            targets: [
                "Package1Library"
            ]
        ),
        .library(
            name: "Package2Library",
            targets: [
                "Package2"
            ]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Package1Library",
            dependencies: []
        ),
        .testTarget(
            name: "Package1Tests",
            dependencies: ["Package1Library"]
        ),
        .target(
            name: "Package2"
        ),
        .testTarget(
            name: "Package2Tests",
            dependencies: ["Package2"]
        )
    ]
)
