import Algorithms
import Foundation
import Utilities

public struct Day10: Day {
    public func part1Solution(for input: Input) -> Int {
        Set(trails(for: input)).count
    }
    
    public func part2Solution(for input: Input) -> Int {
        trails(for: input).count
    }
    
    private func trails(for input: Input) -> [Trail] {
        let grid = Grid(input.lines.map(\.characters.integers))
        
        var partialTrails = grid
            .filter { $0.value == 0 }
            .map { Trail(start: $0.key, current: $0.key) }
        
        var trails: [Trail] = []
        
        while let trail = partialTrails.popLast() {
            guard let height = grid[trail.current] else { continue }
            
            guard height != 9 else {
                trails.append(trail)
                continue
            }
            
            for neighbour in trail.current.cardinalNeighbours
            where grid[neighbour] == height + 1 {
                var trail = trail
                trail.current = neighbour
                partialTrails.append(trail)
            }
        }
        
        return trails
    }
    
    private struct Trail: Hashable {
        let start: Point
        var current: Point
    }
}
