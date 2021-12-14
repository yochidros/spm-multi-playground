// swift-tools-version: 5.5

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "Sample3",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "Sample3",
            targets: ["Demo3"],
            bundleIdentifier: "com.yochidros.Sample3",
            teamIdentifier: "X25KZ54NYC",
            displayVersion: "1.0",
            bundleVersion: "1",
            iconAssetName: "AppIcon",
            accentColorAssetName: "AccentColor",
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    dependencies: [
        .package(name: "SamplePackages", path: "../SamplePackages")
    ],
    targets: [
        .executableTarget(
            name: "Demo3",
            dependencies: [
                .product(name: "Package1Library", package: "SamplePackages", condition: nil),
            ]
        )
    ]
)
