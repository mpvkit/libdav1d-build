// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "libdav1d",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13)],
    products: [
        .library(
            name: "Libdav1d", 
            targets: ["Libdav1d"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "Libdav1d",
            url: "https://github.com/mpvkit/libdav1d_build/releases/download/1.4.3/Libdav1d.xcframework.zip",
            checksum: "ed1939aa68553a4d41dc7a4d41e1f64fda0adbd0d36c220fd85bd2a49d324160"
        )
    ]
)
