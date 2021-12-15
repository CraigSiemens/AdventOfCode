import Foundation
import GameplayKit
import Utilities

public struct Day15: Day {
    class RiskLevelNode: GKGridGraphNode {
        var riskLevel: Int = .max
        
        override func cost(to node: GKGraphNode) -> Float {
            guard let node = node as? RiskLevelNode else { return .greatestFiniteMagnitude }
            return Float(node.riskLevel)
        }
    }
    
    public func part1Solution(for input: Input) -> String {
        let riskLevels = input.lines
            .map { $0.characters.integers }
        
        let width = Int32(riskLevels.first!.count)
        let height = Int32(riskLevels.count)
        
        let graph = GKGridGraph(
            fromGridStartingAt: Point.zero.int2,
            width: Int32(width),
            height: Int32(height),
            diagonalsAllowed: false,
            nodeClass: RiskLevelNode.self
        )
        
        for y in 0..<height {
            for x in 0..<width {
                let node = graph.node(atGridPosition: .init(x: x, y: y)) as? RiskLevelNode
                node?.riskLevel = riskLevels[Int(y)][Int(x)]
            }
        }
        
        return graph
            .findPath(
                from: graph.node(atGridPosition: .init(x: 0, y: 0))!,
                to: graph.node(atGridPosition: .init(x: width - 1, y: height - 1))!
            )
            .dropFirst()
            .compactMap { $0 as? RiskLevelNode }
            .map(\.riskLevel)
            .sum()
            .description
    }

    public func part2Solution(for input: Input) -> String {
        let riskLevels = input.lines
            .map { $0.characters.integers }
        
        let baseWidth = Int32(riskLevels.first!.count)
        let baseHeight = Int32(riskLevels.count)
        let repeatWidth = Int32(5)
        let repeatHeight = Int32(5)
        let width = baseWidth * repeatWidth
        let height = baseHeight * repeatHeight
        
        let graph = GKGridGraph(
            fromGridStartingAt: Point.zero.int2,
            width: Int32(width),
            height: Int32(height),
            diagonalsAllowed: false,
            nodeClass: RiskLevelNode.self
        )
        
        for y in 0..<height {
            for x in 0..<width {
                let node = graph.node(atGridPosition: .init(x: x, y: y)) as? RiskLevelNode
                
                let (levelX, baseX) = x.quotientAndRemainder(dividingBy: baseWidth)
                let (levelY, baseY) = y.quotientAndRemainder(dividingBy: baseHeight)

                let baseRiskLevel = riskLevels[Int(baseY)][Int(baseX)]
                node?.riskLevel = (baseRiskLevel + Int(levelX) + Int(levelY) - 1) % 9 + 1
            }
        }
        
        return graph
            .findPath(
                from: graph.node(atGridPosition: .init(x: 0, y: 0))!,
                to: graph.node(atGridPosition: .init(x: width - 1, y: height - 1))!
            )
            .dropFirst()
            .compactMap { $0 as? RiskLevelNode }
            .map(\.riskLevel)
            .sum()
            .description
    }
}
