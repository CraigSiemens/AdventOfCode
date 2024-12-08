import Algorithms
import Foundation
import Utilities

public struct Day6: Day {
    public func part1Solution(for input: Input) -> Int {
        let grid = Grid(input.lines.characters)
        
        var heading = Heading.Cardinal.north
        var position = grid.first { $0.value == "^" }!.key
        
        var visitedPoints: Set<Point> = []
        while let value = grid[position] {
            if value == "#" {
                position = position.moved(heading.opposite)
                heading = heading.turn(.right)
            } else {
                visitedPoints.insert(position)
                position = position.moved(heading)
            }
        }
        
        return visitedPoints.count
    }
    
    public func part2Solution(for input: Input) -> Int {
        let grid = Grid(input.lines.characters)
        
        var heading = Heading.Cardinal.north
        var position = grid.first { $0.value == "^" }!.key
        
        var visitedPoints: [Point: Set<Heading.Cardinal>] = [:]
        var possibleLocations: Set<Point> = []
        
        while grid[position] != nil {
            visitedPoints[position, default: []].insert(heading)
            
            let nextPosition = position.moved(heading)
            
            if grid[nextPosition] == "#" {
                heading = heading.turn(.right)
                continue
            }
            
            if visitedPoints[nextPosition] == nil {
                var scoutVisitedPoints: [Point: Set<Heading.Cardinal>] = visitedPoints
                var scoutHeading = heading.turn(.right)
                var scoutPosition = position
                while grid[scoutPosition] != nil {
                    if scoutVisitedPoints[scoutPosition, default: []].contains(scoutHeading) {
                        possibleLocations.insert(nextPosition)
                        break
                    }
                    
                    scoutVisitedPoints[scoutPosition, default: []].insert(scoutHeading)
                    let nextScoutPosition = scoutPosition.moved(scoutHeading)
                    
                    if nextScoutPosition == nextPosition || grid[nextScoutPosition] == "#" {
                        scoutHeading = scoutHeading.turn(.right)
                        continue
                    }
                    
                    scoutPosition = nextScoutPosition
                }
            }
            
            position = nextPosition
        }
        
        return possibleLocations.count
    }
}
