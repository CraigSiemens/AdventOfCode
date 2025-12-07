import Algorithms
import Foundation
import Utilities

public struct Day4: Day {
    public func part1Solution(for input: Input) -> Int {
        let grid = Grid(input.lines.characters) { _, character in
            character == "@" ? () : nil
        }
        
        var count = 0
        
        for point in grid.keys {
            let neighbourCount = point.allNeighbours.count { grid[$0] != nil }
            if neighbourCount < 4 {
                count += 1
            }
        }
        
        return count
    }
    
    public func part2Solution(for input: Input) -> Int {
        var grid = Grid(input.lines.characters) { _, character in
            character == "@" ? () : nil
        }
        
        var count = 0
        var remainingPoints = Set(grid.keys)
        
        while let point = remainingPoints.popFirst() {
            guard grid[point] != nil else { continue }
            
            let neighbours = point.allNeighbours
            let neighbourCount = neighbours.count { grid[$0] != nil }
            if neighbourCount < 4 {
                grid[point] = nil
                count += 1
                remainingPoints.formUnion(neighbours)
            }
        }
        
        return count
    }
}
