import Algorithms
import Foundation
import Utilities

public struct Day7: Day {
    public func part1Solution(for input: Input) -> Int {
        var startPoint = Point.zero
        let grid = Grid(input.lines.characters) { point, character in
            if character == "S" {
                startPoint = point
            }
            return character == "^" ? () : nil
        }
        
        let maxY = grid.keys.extremes().max.y
        var splits = 0
        
        var seenBeams: Set<Point> = []
        var beams: [Point] = [startPoint]
        
        while let beam = beams.popLast() {
            guard beam.y <= maxY,
                  seenBeams.insert(beam).inserted
            else { continue }
            
            let next = beam.moved(.south)
            
            if grid[next] != nil {
                splits += 1
                beams.append(next.moved(.west))
                beams.append(next.moved(.east))
            } else {
                beams.append(next)
            }
        }
        
        return splits
    }
    
    public func part2Solution(for input: Input) -> Int {
        var startPoint = Point.zero
        let grid = Grid(input.lines.characters) { point, character in
            if character == "S" {
                startPoint = point
            }
            return character == "^" ? () : nil
        }
        
        let maxY = grid.keys.extremes().max.y
        var pathCountByPoint: [Point: Int] = [:]
        
        func countPaths(for beam: Point) -> Int {
            if let count = pathCountByPoint[beam] {
                return count
            }
            
            var count = 0
            defer { pathCountByPoint[beam] = count }
            
            guard beam.y <= maxY else {
                count += 1
                return count
            }
            
            let next = beam.moved(.south)
            
            if grid[next] != nil {
                count += countPaths(for: next.moved(.west))
                + countPaths(for: next.moved(.east))
            } else {
                count += countPaths(for: next)
            }
            
            return count
        }
        
        return countPaths(for: startPoint)
    }
}
