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
            checksum: "db7d5c46d1518e14fae27a2334c379ebc1c24c46c4649c5b9e5359feef91c8b8"
        )
    ]
)
