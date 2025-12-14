import Algorithms
import Foundation
import Utilities

public struct Day11: Day {
    public func part1Solution(for input: Input) -> Int {
        var graph = Graph<String>()
        
        for line in input.lines {
            let parts = line.words(byCharactersIn: ": ").map(\.raw)
            let id = parts[0]
            graph[id] = Array(parts.dropFirst())
        }
        
        return graph.countPaths(
            from: "you",
            to: "out"
        )
    }
    
    public func part2Solution(for input: Input) -> Int {
        var graph = Graph<String>()
        
        for line in input.lines {
            let parts = line.words(byCharactersIn: ": ").map(\.raw)
            let id = parts[0]
            graph[id] = Array(parts.dropFirst())
        }
        
        return graph.countPaths(
            from: "svr",
            through: ["dac", "fft"],
            to: "out"
        )
    }
}
