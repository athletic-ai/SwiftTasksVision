// swift-tools-version:5.9
import PackageDescription
import Foundation

let package = Package(
    name: "SwiftTasksVision", type: .static,
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftTasksVision", type: .static,
            targets: ["SwiftTasksVision"]
        ),
        .executable(
            name: "UpdatePackage",
            targets: ["UpdatePackage"]
        )
    ],
    targets: [
        .target(
            name: "SwiftTasksVision", type: .static,
            dependencies: ["SwiftTasksVisionCore"]
        ),
        .target(
            name: "SwiftTasksVisionCore",
            dependencies: ["MediaPipeCommonGraphLibraries", "MediaPipeTasksVision"],
            linkerSettings: [
                .unsafeFlags(["-ObjC"]),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("Accelerate"),
                .linkedLibrary("c++")
            ]
        ),
        .binaryTarget(
            name: "MediaPipeTasksVision",
            path: "Dependencies/MediaPipeTasksVision.xcframework"
        ),
        .binaryTarget(
            name: "MediaPipeCommonGraphLibraries",
            path: "Dependencies/MediaPipeCommonGraphLibraries.xcframework"
        ),
        .executableTarget(
            name: "UpdatePackage",
            resources: [
                .process("Resources/MediaPipeVision.Info.plist")
            ]
        ),
    ]
)
