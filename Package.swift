// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let package = Package(
    name: "Advent of Code",
    platforms: [.macOS(.v10_14)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(name: "advent", targets: ["advent"]),
        .library(name: "AdventOfCode2017", targets: ["AdventOfCode2017"]),
        .library(name: "AdventOfCode2018", targets: ["AdventOfCode2018"]),
        .library(name: "AdventOfCode2019", targets: ["AdventOfCode2019"]),
        .library(name: "AdventOfCode2020", targets: ["AdventOfCode2020"]),
        .library(name: "AdventOfCode2021", targets: ["AdventOfCode2021"]),
        .library(name: "Utilities", targets: ["Utilities"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .executableTarget(
            name: "advent",
            dependencies: ["AdventOfCode"]
        ),
        
        .target(
            name: "AdventOfCode",
            dependencies: [
                "AdventOfCode2017",
                "AdventOfCode2018",
                "AdventOfCode2019",
                "AdventOfCode2020",
                "AdventOfCode2021"
            ]
        ),
    
        .target(
            name: "AdventOfCode2017",
            dependencies: ["Utilities"],
            exclude: inputFiles(for: 2017)
        ),
        .target(
            name: "AdventOfCode2018",
            dependencies: ["Utilities"],
            exclude: inputFiles(for: 2018)
        ),
        .target(
            name: "AdventOfCode2019",
            dependencies: ["Utilities"],
            exclude: inputFiles(for: 2019)
        ),
        .target(
            name: "AdventOfCode2020",
            dependencies: [
                "Utilities",
                .product(name: "Algorithms", package: "swift-algorithms")
            ],
            exclude: inputFiles(for: 2020)
        ),
        .target(
            name: "AdventOfCode2021",
            dependencies: [
                "Utilities",
                .product(name: "Algorithms", package: "swift-algorithms")
            ],
            exclude: inputFiles(for: 2021)
        ),
        
        .target(
            name: "Utilities",
            dependencies: [.product(name: "Algorithms", package: "swift-algorithms")]
        ),

        .testTarget(
            name: "AdventOfCode2017Tests",
            dependencies: ["AdventOfCode2017"]),
        
        .testTarget(
            name: "AdventOfCode2018Tests",
            dependencies: ["AdventOfCode2018"]),
        
        .testTarget(
            name: "AdventOfCode2019Tests",
            dependencies: ["AdventOfCode2019"]),
        
        .testTarget(
            name: "AdventOfCode2020Tests",
            dependencies: ["AdventOfCode2020"]),
        
        .testTarget(
            name: "AdventOfCode2021Tests",
            dependencies: ["AdventOfCode2021"]),
        
        .testTarget(
            name: "UtilitiesTests",
            dependencies: ["Utilities"]),
    ]
)

func inputFiles(for year: Int) -> [String] {
    let sourceDirectory = URL(fileURLWithPath: #file)
        .deletingLastPathComponent()
        .appendingPathComponent("Sources")
        .appendingPathComponent("AdventOfCode\(year)")
    
    return FileManager.default
        .enumerator(
            at: sourceDirectory,
            includingPropertiesForKeys: nil,
            options: .producesRelativePathURLs
        )?
        .compactMap { $0 as? URL }
        .filter { $0.lastPathComponent == "input.txt" }
        .map { $0.relativePath }
        ?? []
}
