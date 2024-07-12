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
            checksum: "9e6b0d20266b51dd29b2196fdca2576fe656c3be0fd17cfab5da6e091d0c1fac"
        )
    ]
)
