import Foundation
import BuildShared

do {
    let options = try BuildRunner.performCommand()
    try BuildDav1d(options: options).buildALL()
} catch {
    print(error.localizedDescription)
    exit(1)
}


enum Library: String, CaseIterable, BuildLibrary {
    case libdav1d
    var version: String {
        switch self {
        case .libdav1d:    // AV1 decoding
            return "1.5.3"
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
        let releaseVersion = BuildRunner.options?.releaseVersion ?? version
        switch self {
        case .libdav1d:
            return  [
                .target(
                    name: "Libdav1d",
                    url: "https://github.com/mpvkit/libdav1d-build/releases/download/\(releaseVersion)/Libdav1d.xcframework.zip",
                    checksum: "https://github.com/mpvkit/libdav1d-build/releases/download/\(releaseVersion)/Libdav1d.xcframework.checksum.txt"
                ),
            ]
        }
    }
}


private class BuildDav1d: BaseBuild {
    init(options: ArgumentOptions) {
        super.init(library: .libdav1d, options: options)
    }

    override func beforeBuild() throws {
        try super.beforeBuild()

        
        if Utility.shell("which ninja") == nil {
            Utility.shell("brew install ninja")
        }
        if Utility.shell("which nasm") == nil {
            Utility.shell("brew install nasm")
        }
    }

    override func arguments(platform _: PlatformType, arch _: ArchType) -> [String] {
        [
            "-Denable_asm=false",   // disable "No platform load command found" warning after xcode 15

            "-Denable_tests=false",
            "-Denable_tools=false", 
            "-Denable_examples=false", 
            "-Dxxhash_muxer=disabled",
        ]
    }
}
