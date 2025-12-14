import Algorithms
import Foundation
import Utilities

public struct Day11: Day {
    public func part1Solution(for input: Input) -> Int {
        var nodes: [String: [String]] = [:]
        
        for line in input.lines {
            let parts = line.words(byCharactersIn: ": ").map(\.raw)
            let id = parts[0]
            nodes[id] = Array(parts.dropFirst())
        }
        
        func countPaths(
            from: String,
            to: String
        ) -> Int {
            guard from != to else { return 1 }
            
            var count = 0
            
            for connectedNode in nodes[from]! {
                count += countPaths(from: connectedNode, to: to)
            }
            
            return count
        }
        
        return countPaths(
            from: "you",
            to: "out"
        )
    }
    
    public func part2Solution(for input: Input) -> Int {
        var nodes: [String: [String]] = [:]
        
        for line in input.lines {
            let parts = line.words(byCharactersIn: ": ").map(\.raw)
            let id = parts[0]
            nodes[id] = Array(parts.dropFirst())
        }
        
        var pathCounts: [String: Int] = [:]
        
        func countPaths(
            from: String,
            through: some Collection<String>,
            to: String
        ) -> Int {
            guard from != to else {
                return 1
            }
            
            var count = 0
            
            if through.isEmpty {
                if let pathCount = pathCounts["\(from)-\(to)"] {
                    return pathCount
                }
                
                for connectedNode in nodes[from] ?? [] {
                    count += countPaths(from: connectedNode, through: [], to: to)
                }
                
                pathCounts["\(from)-\(to)"] = count
            } else {
                for throughNodeOrders in through.permutations(ofCount: through.count) {
                    let throughNode = throughNodeOrders.first!
                    
                    let firstPathCount = countPaths(
                        from: from,
                        through: [],
                        to: throughNode
                    )
                    
                    guard firstPathCount > 0 else { continue }
                    
                    let remainingPathCount = countPaths(
                        from: throughNode,
                        through: throughNodeOrders.dropFirst(),
                        to: to
                    )
                    
                    count += firstPathCount * remainingPathCount
                }
            }
            
            return count
        }
        
        return countPaths(
            from: "svr",
            through: ["dac", "fft"],
            to: "out"
        )
    }
}
