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
            checksum: "a969189bcb70dd3eb887850ff1a304b75847565d7375ccdd926a4d664ae10f60"
        )
    ]
)
