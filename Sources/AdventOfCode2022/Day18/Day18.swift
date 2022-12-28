import Algorithms
import Foundation
import Utilities

public struct Day18: Day {
    public func part1Solution(for input: Input) -> Int {
        let points = input.lines
            .map {
                let v = $0.commaSeparatedWords.integers
                return Point3(x: v[0], y: v[1], z: v[2])
            }
        
        var surfaceArea = 0
        var insertedPoints: Set<Point3> = []
        
        for point in points {
            let neighboursCount = point
                .faceNeighbours
                .count(where: insertedPoints.contains)
            
            surfaceArea += 6
            surfaceArea -= neighboursCount * 2
            insertedPoints.insert(point)
        }
        
        return surfaceArea
    }

    public func part2Solution(for input: Input) -> Int {
        let points = input.lines
            .map {
                let v = $0.commaSeparatedWords.integers
                return Point3(x: v[0], y: v[1], z: v[2])
            }
        
        let insertedPoints = Set(points)
        let surfacePoint = insertedPoints.min { $0.x < $1.x }!
        
        var airPoints: Set<Point3> = [surfacePoint + .xNeg]
        var visitedAirPoints: Set<Point3> = []
        var surfaceArea = 0
        
        while let point = airPoints.popFirst() {
            guard visitedAirPoints.insert(point).inserted
            else { continue }
            
            let solidNeighbours = point
                .faceNeighbours
                .count(where: insertedPoints.contains)
            
            if solidNeighbours > 0
                || point.edgeNeighbours
                .contains(where: insertedPoints.contains) {
                airPoints.formUnion(
                    point.faceNeighbours
                        .filter { !insertedPoints.contains($0) }
                )
            }
            
            surfaceArea += solidNeighbours
        }
        
        return surfaceArea
    }
}
