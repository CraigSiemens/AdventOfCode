import Foundation
import Utilities

public struct Day3: Day {
    public let number: Int = 3

    private func treeCount(grid: [[Character]], move: Point) -> Int {
        var point = Point.zero
        var treeCount = 0
        
        while point.y < grid.count {
            if grid[point.y][point.x] == "#" {
                treeCount += 1
            }
            
            point += move
            point.x = point.x % grid[0].count
        }

        return treeCount
    }
    
    public func part1Solution(for input: String = input) -> String {
        let grid = Input(input)
            .lines
            .map { $0.characters }
        
        return "\(treeCount(grid: grid, move: Point(x: 3, y: 1)))"
    }

    public func part2Solution(for input: String = input) -> String {
        let grid = Input(input)
            .lines
            .map { $0.characters }
        
        let moves = [
            Point(x: 1, y: 1),
            Point(x: 3, y: 1),
            Point(x: 5, y: 1),
            Point(x: 7, y: 1),
            Point(x: 1, y: 2)
        ]
        
        let result = moves
            .map { treeCount(grid: grid, move: $0) }
            .reduce(1, *)
        
        return "\(result)"
    }
}
