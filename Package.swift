// swift-tools-version:5.6
import PackageDescription

let package = Package(
	name: "swift-nio-tftp",
	platforms: [
		.macOS(.v12),
	],
	dependencies: [
	    .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0")
        ],
	targets: [
		.target(
			name: "main",
			dependencies: [
			    .product(name: "NIOCore", package: "swift-nio"),
                            .product(name: "NIOPosix", package: "swift-nio"),
                        ],
			swiftSettings: [
				// Enable better optimizations when building in Release configuration. Despite the use of
				// the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
				// builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
				.unsafeFlags(["-cross-module-optimization"], .when(configuration: .release)),
			]
		),
		.executableTarget(name: "main", dependencies: []),
	]
)
