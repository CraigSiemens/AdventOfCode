import Algorithms
import Foundation
import Utilities

public struct Day9: Day {
    public func part1Solution(for input: Input) -> Int {
        let points = input.lines.map { line in
            let components = line.commaSeparatedWords.integers
            return Point(x: components[0], y: components[1])
        }
        
        var maxArea = 0
        for points in points.combinations(ofCount: 2) {
            let area = points[0].gridArea(with: points[1])
            if area > maxArea {
                maxArea = area
            }
        }
        
        return maxArea
    }
    
    public func part2Solution(for input: Input) -> Int {
        let points = input.lines.map { line in
            let components = line.commaSeparatedWords.integers
            return Point(x: components[0], y: components[1])
        }
        
        var xAxisLinesByYPosition: [Int: [ClosedRange<Int>]] = [:]
        var yAxisLinesByXPosition: [Int: [ClosedRange<Int>]] = [:]
        
        func addLine(_ a: Point, _ b: Point) {
            if a.x == b.x {
                let range = ClosedRange(a.y, b.y)
                yAxisLinesByXPosition[a.x, default: []].append(range)
            } else {
                let range = ClosedRange(a.x, b.x)
                xAxisLinesByYPosition[a.y, default: []].append(range)
            }
        }
        
        for points in points.adjacentPairs() {
            addLine(points.0, points.1)
        }
        addLine(points.first!, points.last!)
        
        var maxArea = 0
        combinationLoop: for points in points.combinations(ofCount: 2) {
            var xLine = ClosedRange(points[0].x, points[1].x)
            var yLine = ClosedRange(points[0].y, points[1].y)
            
            if xLine.count > 2 && yLine.count > 2 {
                // Inset the lines since we only need to check if a line fully intersects the
                // rectangle. It doesn't matter if a line is tangent to an edge of the rectangle.
                xLine = xLine.inset(1)
                yLine = yLine.inset(1)
                
                for y in xAxisLinesByYPosition.keys
                where yLine.contains(y) {
                    for line in xAxisLinesByYPosition[y]! {
                        if line.overlaps(xLine) {
                            continue combinationLoop
                        }
                    }
                }
                
                for x in yAxisLinesByXPosition.keys
                where xLine.contains(x) {
                    for line in yAxisLinesByXPosition[x]! {
                        if line.overlaps(yLine) {
                            continue combinationLoop
                        }
                    }
                }
            }
            
            let area = points[0].gridArea(with: points[1])
            if area > maxArea {
                maxArea = area
            }
        }
        
        return maxArea
    }
}

private extension ClosedRange {
    /// Init that takes to values with any order and creates a range
    init(_ a: Bound, _ b: Bound) {
        self = if a <= b {
            a...b
        } else {
            b...a
        }
    }
}
