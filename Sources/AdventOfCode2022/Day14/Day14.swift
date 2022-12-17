import Algorithms
import Foundation
import Utilities

public struct Day14: Day {
    func parse(input: Input) -> (Set<Point>, Int) {
        let points = input.lines.flatMap { line in
            line.words(by: " -> ")
                .map(\.commaSeparatedWords.integers)
                .map { Point(x: $0[0], y: $0[1]) }
                .adjacentPairs()
                .flatMap { Point.all(from: $0, to: $1) }
        }
        
        return (Set(points), points.map(\.y).max() ?? 0)
    }
    
    public func part1Solution(for input: Input) -> Int {
        var (grid, maxY) = parse(input: input)
        
        let startPoint = Point(x: 500, y: 0)
        let directions = [
            Point(x: 0, y: 1),
            Point(x: -1, y: 1),
            Point(x: 1, y: 1)
        ]
        
        // Add sand
        var count = 0
        while true {
            var point = startPoint
            count += 1
            
            // Move sand
            while point.y <= maxY {
                let nextPoint = directions
                    .map { point + $0 }
                    .first { !grid.contains($0) }
                
                guard let nextPoint else { break }
                point = nextPoint
            }
            grid.insert(point)
            
            guard point.y <= maxY else {
                return count - 1
            }
        }
    }

    public func part2Solution(for input: Input) -> Int {
        var (grid, maxY) = parse(input: input)
        maxY += 1
        
        let startPoint = Point(x: 500, y: 0)
        let directions = [
            Point(x: 0, y: 1),
            Point(x: -1, y: 1),
            Point(x: 1, y: 1)
        ]
        
        // Add sand
        var count = 0
        while true {
            var point = startPoint
            count += 1
            
            // Move sand
            while point.y < maxY {
                let nextPoint = directions
                    .map { point + $0 }
                    .first { !grid.contains($0) }
                
                guard let nextPoint else { break }
                point = nextPoint
            }
            grid.insert(point)
            
            guard point != startPoint else {
                return count
            }
        }
    }
}
