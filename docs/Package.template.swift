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
            url: "\(Libdav1d_url)",
            checksum: "\(Libdav1d_checksum)"
        )
    ]
)
