import Algorithms
import Foundation
import Utilities

public struct Day8: Day {
    enum Visibility: String {
        case visible = "X"
        case hidden = " "
        case unknown = "?"
    }
    
    public func part1Solution(for input: Input) -> Int {
        let heights = input.lines.map(\.integers)
        let gridWidth = heights[0].count
        let gridHeight = heights.count
        
        let heightGrid = Grid(heights)
        
        var visiblePoints: Set<Point> = []
        
        func update(for points: [Point], heading: Heading.Cardinal) {
            for point in points {
                var point = point
                var maxHeight = -1
                
                while let height = heightGrid[point] {
                    if height > maxHeight {
                        maxHeight = height
                        visiblePoints.insert(point)
                    }
                    point = point.moved(heading)
                }
            }
        }
        
        update(
            for: (0..<gridWidth).map { Point(x: $0, y: 0) },
            heading: .south
        )
        
        update(
            for: (0..<gridWidth).map { Point(x: $0, y: gridHeight - 1) },
            heading: .north
        )
        
        update(
            for: (0..<gridHeight).map { Point(x: 0, y: $0) },
            heading: .east
        )

        update(
            for: (0..<gridHeight).map { Point(x: gridWidth - 1, y: $0) },
            heading: .west
        )
        
        return visiblePoints.count
    }

    public func part2Solution(for input: Input) -> Int {
        let heights = input.lines.map(\.integers)
        let heightGrid = Grid(heights)

        func count(from point: Point, heading: Heading.Cardinal) -> Int {
            let maxHeight = heightGrid[point, default: 0]
            
            var point = point.moved(heading)
            var count = 0
            
            while let height = heightGrid[point] {
                count += 1
                
                if height >= maxHeight {
                    break
                }
                
                point = point.moved(heading)
            }
            
            return count
        }
        
        var bestScore = 0
        for point in heightGrid.keys {
            let score = Heading.Cardinal.allCases.map { count(from: point, heading: $0) }.product()
            bestScore = max(bestScore, score)
        }
        
        return bestScore
    }
}
