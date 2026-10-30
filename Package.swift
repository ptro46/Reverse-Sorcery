// swift-tools-version: 5.9
import PackageDescription
let package = Package(name: "Sorcery", platforms: [.macOS(.v13)], products: [
    .executable(name: "SorceryMac", targets: ["SorceryMac"])
], targets: [
    .target(name: "SorceryCore"),
    .executableTarget(name: "SorceryMac", dependencies: ["SorceryCore"], resources: [.copy("Resources")]),
    .testTarget(name: "SorceryCoreTests", dependencies: ["SorceryCore"])
])
