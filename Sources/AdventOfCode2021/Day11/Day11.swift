import Foundation
import Utilities

public struct Day11: Day {
    private func flashCount(for grid: inout Grid<Int>) -> Int {
        var shouldFlash = Set<Point>()
        var flashed = Set<Point>()
        
        func increment(_ point: Point) {
            guard let value = grid[point] else { return }
            grid[point] = value + 1
            
            if value + 1 > 9 {
                shouldFlash.insert(point)
            }
        }
        
        for point in grid.keys {
            increment(point)
        }
        
        while let point = shouldFlash.popFirst() {
            guard flashed.insert(point).inserted else { continue }
            
            for neighbour in point.allNeighbours {
                increment(neighbour)
            }
        }
        
        for point in flashed {
            grid[point] = 0
        }
        
        return flashed.count
    }
    
    public func part1Solution(for input: Input) -> String {
        var grid = Grid(input.lines.map(\.characters.integers))
        
        var totalFlashCount = 0
        for _ in 0..<100 {
            totalFlashCount += flashCount(for: &grid)
        }
        
        return totalFlashCount.description
    }
    
    public func part2Solution(for input: Input) -> String {
        var grid = Grid(input.lines.map(\.characters.integers))
        
        for i in 1... {
            if flashCount(for: &grid) == 100 {
                return i.description
            }
        }
        
        return "not solved"
    }
}
