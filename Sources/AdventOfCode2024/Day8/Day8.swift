import Algorithms
import Foundation
import Utilities

public struct Day8: Day {
    public func part1Solution(for input: Input) -> Int {
        let grid = Grid(input.lines.characters)
        
        var antennas = Dictionary(grouping: grid) { $0.value }
            .mapValues { $0.map(\.key) }
        antennas["."] = nil
        
        var antinodes: Set<Point> = []
        
        for (_, antennas) in antennas {
            for combination in antennas.combinations(ofCount: 2) {
                let diff = combination[0] - combination[1]
                antinodes.insert(combination[0] + diff)
                antinodes.insert(combination[1] - diff)
            }
        }
        
        return antinodes.count { grid[$0] != nil }
    }
    
    public func part2Solution(for input: Input) -> Int {
        let grid = Grid(input.lines.characters)
        
        var antennas = Dictionary(grouping: grid) { $0.value }
            .mapValues { $0.map(\.key) }
        antennas["."] = nil
        
        var antinodes: Set<Point> = []
        
        for (_, antennas) in antennas {
            for combination in antennas.combinations(ofCount: 2) {
                let diff = combination[0] - combination[1]
                
                var node = combination[0]
                while grid[node] != nil {
                    antinodes.insert(node)
                    node = node + diff
                }
                
                node = combination[1]
                while grid[node] != nil {
                    antinodes.insert(node)
                    node = node - diff
                }
            }
        }
        
        return antinodes.count
    }
}
