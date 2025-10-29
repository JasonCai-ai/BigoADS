// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BigoADS",
    defaultLocalization: "en",
    products: [
        .library(
            name: "BigoADS",
            targets: ["BigoADSRes"]
        ),
    ],
    dependencies: [],
    targets: [
        // This is a wrapper target to configure various settings required by main binary target.
        .target(
            name: "BigoADSRes",
            dependencies: [
                .target(name: "BigoADS")
            ],
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AppTrackingTransparency"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("Foundation"),
                .linkedFramework("MessageUI"),
                .linkedFramework("SafariServices"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedFramework("WebKit"),
                
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("xml2"),
                .linkedLibrary("resolv"),
                
                // NOTE: Swift Package Manager currently does not allow dependencies with unsafeFlags, unless a specific branch/commit is used.
                // For now, these flags should be added manually to the project for integration.
                 .unsafeFlags(["-ObjC"])
            ]
        ),
        .binaryTarget(
            name: "BigoADS",
            url: "https://static-fed-oss.adsbigo.com/bigoads-framework/BigoADS_50000_61.zip",
            checksum: "31051b442d6ae90624b45d7420cb2b2b5cdab1fca614aafc6c33be91358dea02"
        )
    ]
)
