import Foundation
import Darwin

do {
    let options = try ArgumentOptions.parse(CommandLine.arguments)
    try Build.performCommand(options)


    try BuildDav1d().buildALL()
} catch {
    print(error.localizedDescription)
    exit(1)
}


enum Library: String, CaseIterable {
    case libdav1d
    var version: String {
        switch self {
        case .libdav1d:    // AV1 decoding
            return "1.4.3"
        }
    }

    var url: String {
        switch self {
        case .libdav1d:
            return "https://github.com/videolan/dav1d"
        }
    }

    // for generate Package.swift
    var targets : [PackageTarget] {
        switch self {
        case .libdav1d:
            return  [
                .target(
                    name: "Libdav1d",
                    url: "https://github.com/mpvkit/libdav1d-build/releases/download/\(BaseBuild.options.releaseVersion)/Libdav1d.xcframework.zip",
                    checksum: "https://github.com/mpvkit/libdav1d-build/releases/download/\(BaseBuild.options.releaseVersion)/Libdav1d.xcframework.checksum.txt"
                ),
            ]
        }
    }
}


private class BuildDav1d: BaseBuild {
    init() {
        super.init(library: .libdav1d)

        if Utility.shell("which ninja") == nil {
            Utility.shell("brew install ninja")
        }
        if Utility.shell("which nasm") == nil {
            Utility.shell("brew install nasm")
        }
    }

    override func arguments(platform _: PlatformType, arch _: ArchType) -> [String] {
        [
            "-Denable_asm=true",
            "-Denable_tests=false",
            "-Denable_tools=false", 
            "-Denable_examples=false", 
            "-Dxxhash_muxer=disabled",
        ]
    }
}
