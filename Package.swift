// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Advent of Code",
    platforms: [.macOS(.v10_14)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(name: "advent", targets: ["advent"]),
        .library(name: "AdventOfCode2018", targets: ["AdventOfCode2018"]),
        .library(name: "AdventOfCode2019", targets: ["AdventOfCode2019"]),
        .library(name: "Utilities", targets: ["Utilities"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(name: "advent", dependencies: ["AdventOfCode"]),
        
        .target(name: "AdventOfCode",
                dependencies: ["AdventOfCode2018", "AdventOfCode2019"]),
        
        .target(name: "AdventOfCode2018", dependencies: ["Utilities"]),
        .target(name: "AdventOfCode2019", dependencies: ["Utilities"]),
        
        .target(
            name: "Utilities",
            dependencies: []),
        
        .testTarget(
            name: "AdventOfCode2018Tests",
            dependencies: ["AdventOfCode2018"]),
        
        .testTarget(
            name: "AdventOfCode2019Tests",
            dependencies: ["AdventOfCode2019"]),
        
        .testTarget(
            name: "UtilitiesTests",
            dependencies: ["Utilities"]),
    ]
)
