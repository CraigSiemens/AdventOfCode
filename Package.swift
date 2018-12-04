// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode2018",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(
            name: "AdventOfCode2018",
            targets: ["AdventOfCode2018"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "AdventOfCode2018",
            dependencies: [
                "Day1",
                "Day2",
                "Day3",
                "Day4",
                // {DEPENDENCIES}
            ]),
        .testTarget(
            name: "AdventOfCode2018Tests",
            dependencies: ["AdventOfCode2018"]),
        
        .target(
            name: "Utilities",
            dependencies: []),
                
        .target(
            name: "Day1",
            dependencies: ["Utilities"]),
        .target(
            name: "Day2",
            dependencies: ["Utilities"]),
        .target(
            name: "Day3",
            dependencies: ["Utilities"]),
        .target(
            name: "Day4",
            dependencies: ["Utilities"]),
        // {TARGET}
    ]
)
