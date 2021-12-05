import Foundation

public struct Day12: Day {
    public func part1Solution(for input: String = input) -> String {
        let lines = input
            .components(separatedBy: "\n")
        
        let nodes = (0..<lines.count).map { _ in GKGraphNode() }
        
        lines
            .map {
                $0.components(separatedBy: CharacterSet(charactersIn: "<->, "))
                    .filter { !$0.isEmpty }
                    .compactMap { s in Int(s) }
                    .dropFirst()
                    .map { nodes[$0] }
            }
            .enumerated()
            .forEach { nodes[$0.0].addConnections(to: $0.1, bidirectional: true) }
        
        var seen: Set<GKGraphNode> = []
        var stack: Set<GKGraphNode> = [nodes[0]]
        while !stack.isEmpty {
            let node = stack.removeFirst()
            seen.insert(node)
            stack.formUnion(node.connectedNodes.filter { !seen.contains($0) })
        }
        
        return "\(seen.count)"
    }

    public func part2Solution(for input: String = input) -> String {
        let lines = input
            .components(separatedBy: "\n")
        
        let nodes = (0..<lines.count).map { _ in GKGraphNode() }
        
        lines
            .map {
                $0.components(separatedBy: CharacterSet(charactersIn: "<->, "))
                    .filter { !$0.isEmpty }
                    .compactMap { s in Int(s) }
                    .dropFirst()
                    .map { nodes[$0] }
            }
            .enumerated()
            .forEach { nodes[$0.0].addConnections(to: $0.1, bidirectional: true) }
        
        var seen: Set<GKGraphNode> = []
        var subgraphCount = 0
        
        while seen.count != nodes.count {
            let firstUnseenNode = nodes.lazy.filter { !seen.contains($0) }.first!
            var stack: Set<GKGraphNode> = [firstUnseenNode]
            
            while !stack.isEmpty {
                let node = stack.removeFirst()
                seen.insert(node)
                stack.formUnion(node.connectedNodes.filter { !seen.contains($0) })
            }
            
            subgraphCount += 1
        }
        
        return "\(subgraphCount)"
    }
}
