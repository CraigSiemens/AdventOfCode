import Algorithms
import Foundation
import Utilities

public struct Day10: Day {
    public func part1Solution(for input: Input) -> Int {
        let pipes: [Character: Set<Heading.Cardinal>] = [
            "|": [.north, .south],
            "-": [.east, .west],
            "L": [.north, .east],
            "J": [.north, .west],
            "7": [.south, .west],
            "F": [.south, .east]
        ]
        
        var startPoint = Point.zero
        let grid = Grid(input.lines.map(\.characters)) { point, input in
            if input == "S" {
                startPoint = point
            }
            return pipes[input]
        }
        
        var heading = Heading.Cardinal.allCases
            .first { heading in
                let point = startPoint.moved(heading)
                return (grid[point]?.contains(heading.opposite)) ?? false
            }!
        var point = startPoint.moved(heading)
        var steps = 1
        
        while point != startPoint {
            heading = grid[point]!.first { $0 != heading.opposite }!
            point = point.moved(heading)
            steps += 1
        }
        
        return steps / 2
    }
    
    /// First Solution
    /// - Find path while tracking the
    ///   - turns made
    ///   - points one left and right of path
    /// - based on turns, we know either left or right are inside the path
    /// - flood fill from those points to find all inside points
    public func part2Solution(for input: Input) -> Int {
        let pipes: [Character: Set<Heading.Cardinal>] = [
            "|": [.north, .south],
            "-": [.east, .west],
            "L": [.north, .east],
            "J": [.north, .west],
            "7": [.south, .west],
            "F": [.south, .east]
        ]
        
        var startPoint = Point.zero
        let grid = Grid(input.lines.map(\.characters)) { point, input in
            if input == "S" {
                startPoint = point
            }
            return pipes[input]
        }
        
        var heading = Heading.Cardinal.allCases
            .first { heading in
                let point = startPoint.moved(heading)
                return (grid[point]?.contains(heading.opposite)) ?? false
            }!
        var point = startPoint.moved(heading)
        var pathPoints: Set<Point> = [startPoint, point]
        var seenLeftPoints: Set<Point> = []
        var seenRightPoints: Set<Point> = []
        
        /// Positive if the path the clockwise, negative if counter-clockwise.
        var turnSum = 0
        
        while point != startPoint {
            let newHeading = grid[point]!.first { $0 != heading.opposite }!
            
            seenLeftPoints.insert(point.moved(heading.turn(.left)))
            seenRightPoints.insert(point.moved(heading.turn(.right)))
            seenLeftPoints.insert(point.moved(newHeading.turn(.left)))
            seenRightPoints.insert(point.moved(newHeading.turn(.right)))
            turnSum += heading.direction(to: newHeading).turnValue
            
            heading = newHeading
            
            point = point.moved(heading)
            pathPoints.insert(point)
        }
        
        var enclosedPoints = turnSum > 0 ? seenLeftPoints : seenRightPoints
        enclosedPoints.subtract(pathPoints)
        
        // Flood fill
        var remainingPoints = Set(enclosedPoints.flatMap(\.cardinalNeighbours))
        while let point = remainingPoints.popFirst() {
            guard !pathPoints.contains(point),
                  !enclosedPoints.contains(point)
            else { continue }
            
            enclosedPoints.insert(point)
            remainingPoints.formUnion(point.cardinalNeighbours)
        }
        
        return enclosedPoints.count
    }
    
    /// Second solution trigged by a slack conversation
    /// - Scan across the grid
    ///   - if a point is a perpendicular pipe, toggle isInside
    ///   - if a point is partially perpendicular pipe (ie turn)
    ///     - if the next turn contains the other perpendicular direction, toggle isInside
    ///     - if the next turn contain the same perpendicular direction, don't toggle isInside
    public func part2BSolution(for input: Input) -> Int {
        let pipes: [Character: Set<Heading.Cardinal>] = [
            "|": [.north, .south],
            "-": [.east, .west],
            "L": [.north, .east],
            "J": [.north, .west],
            "7": [.south, .west],
            "F": [.south, .east]
        ]
        
        var startPoint = Point.zero
        var grid = Grid(input.lines.map(\.characters)) { point, input in
            if input == "S" {
                startPoint = point
            }
            return pipes[input]
        }
        
        let startHeadings = Heading.Cardinal.allCases
            .filter { heading in
                let point = startPoint.moved(heading)
                return (grid[point]?.contains(heading.opposite)) ?? false
            }
        grid[startPoint] = .init(startHeadings)
        
        var heading = startHeadings.first!
        var point = startPoint.moved(heading)
        var pathPoints: Set<Point> = [startPoint, point]
        
        while point != startPoint {
            heading = grid[point]!.first { $0 != heading.opposite }!
            point = point.moved(heading)
            pathPoints.insert(point)
        }
        
        let bounds = grid.keys.extremes()
        var count = 0
        for x in bounds.min.x...bounds.max.x {
            var isInside = false
            var partial: Heading.Cardinal?
            
            for y in bounds.min.y...bounds.max.y {
                let point = Point(x: x, y: y)
                
                if pathPoints.contains(point),
                   let value = grid[point] {
                    
                    let crossing = value.intersection([.west, .east])
                    if crossing.count == 2 {
                        isInside.toggle()
                    } else if crossing.count == 1 {
                        if partial != nil {
                            if partial != crossing.first! {
                                isInside.toggle()
                            }
                            partial = nil
                        } else {
                            partial = crossing.first!
                        }
                    }
                } else if isInside {
                    count += 1
                }
            }
        }
        
        return count
    }
}

private extension Direction {
    /// Positive if part of a counter-clockwise path, negative if clockwise, 0 if straight.
    /// https://en.wikipedia.org/wiki/Curve_orientation
    var turnValue: Int {
        switch self {
        case .left: return 1
        case .right: return -1
        default: return 0
        }
    }
}
