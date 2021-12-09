import Foundation
import Utilities

public struct Day9: Day {
    public func part1Solution(for input: Input) -> String {
        let heightMap = Grid(input.lines.map(\.characters.integers))
        
        var riskLevel = 0
        
        for (point, value) in heightMap {
            let isLowPoint = point
                .neighbours
                .compactMap { heightMap[$0] }
                .allSatisfy { $0 > value }
                
            if isLowPoint {
                riskLevel += value + 1
            }
        }
        
        return riskLevel.description
    }

    public func part2Solution(for input: Input) -> String {
        let heightMap = Grid(input.lines.map(\.characters.integers))
        
        var lowPoints = Array<Point>()
        for (point, value) in heightMap {
            let isLowPoint = point
                .neighbours
                .compactMap { heightMap[$0] }
                .allSatisfy { $0 > value }
                
            if isLowPoint {
                lowPoints.append(point)
            }
        }
        
        var basinSizes = Array<Int>()
        for lowPoint in lowPoints {
            var pointsToVisit = [lowPoint]
            var visitedPoints = Set<Point>()
            
            while let point = pointsToVisit.popLast() {
                guard let value = heightMap[point],
                      value < 9,
                      visitedPoints.insert(point).inserted
                else { continue }
                
                pointsToVisit.append(contentsOf: point.neighbours)
            }
            
            basinSizes.append(visitedPoints.count)
        }
        
        return basinSizes.max(count: 3).reduce(1, *).description
    }
}
