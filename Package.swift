// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let years = 2017...2022

var package = Package(
    name: "Advent of Code",
    platforms: [.macOS(.v13)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(name: "advent", targets: ["advent"]),
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
            dependencies: ["Utilities"] + years.map { .byName(name: "AdventOfCode\($0)") }
        ),
        
        .target(
            name: "Utilities",
            dependencies: [.product(name: "Algorithms", package: "swift-algorithms")]
        ),
        .testTarget(
            name: "UtilitiesTests",
            dependencies: ["Utilities"]
        ),
    ]
)

package.products.append(contentsOf: years.map(product(forYear:)))
package.targets.append(contentsOf: years.flatMap(targets(forYear:)))

// MARK: - Helper Methods

func product(forYear year: Int) -> Product {
    let name = "AdventOfCode\(year)"
    return .library(name: name, targets: [name])
}

func targets(forYear year: Int) -> [Target] {
    let name = "AdventOfCode\(year)"
    
    let sourceDirectory = URL(fileURLWithPath: #file)
        .deletingLastPathComponent()
        .appendingPathComponent("Sources")
        .appendingPathComponent(name)
    
    let inputFiles = FileManager.default
        .enumerator(
            at: sourceDirectory,
            includingPropertiesForKeys: nil,
            options: .producesRelativePathURLs
        )?
        .compactMap { $0 as? URL }
        .filter { $0.lastPathComponent == "input.txt" }
        .map { $0.relativePath }
    ?? []
    
    return [
        .target(
            name: name,
            dependencies: [
                "Utilities",
                .product(name: "Algorithms", package: "swift-algorithms")
            ],
            exclude: inputFiles
        ),
        .testTarget(
            name: "\(name)Tests",
            dependencies: [
                .byName(name: name)
            ]
        )
    ]
}
