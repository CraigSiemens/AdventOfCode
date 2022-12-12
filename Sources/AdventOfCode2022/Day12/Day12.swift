import Algorithms
import Foundation
import Utilities

public struct Day12: Day {
    public func part1Solution(for input: Input) -> Int {
        var characterGrid = Grid(input.lines.map(\.characters))
        
        let start = characterGrid.first { $0.value == "S" }!.key
        let end = characterGrid.first { $0.value == "E" }!.key
        
        characterGrid[start] = "a"
        characterGrid[end] = "z"
        
        let heightGrid = characterGrid
            .mapValues { Int($0.asciiValue! - Character("a").asciiValue!) }
        
        var visitedPoints: Set<Point> = [start]
        var paths: [[Point]] = [[start]]
        
        while let path = paths.first {
            paths.removeFirst()
            
            let position = path.last!
            let height = heightGrid[position]!
            
            for neighbour in position.cardinalNeighbours {
                guard let neighbourHeight = heightGrid[neighbour],
                      neighbourHeight - height <= 1,
                      visitedPoints.insert(neighbour).inserted
                else { continue }
                
                guard neighbour != end else {
                    return path.count
                }
                
                paths.append(path + [neighbour])
            }
        }
        
        return -1
    }

    public func part2Solution(for input: Input) -> Int {
        var characterGrid = Grid(input.lines.map(\.characters))
        
        let start = characterGrid.first { $0.value == "E" }!.key
        let end = characterGrid.first { $0.value == "S" }!.key
        
        characterGrid[start] = "z"
        characterGrid[end] = "a"
        
        let heightGrid = characterGrid
            .mapValues { Int($0.asciiValue! - Character("a").asciiValue!) }
        
        var visitedPoints: Set<Point> = [start]
        var paths: [[Point]] = [[start]]
        
        while let path = paths.first {
            paths.removeFirst()
            
            let position = path.last!
            let height = heightGrid[position]!
            
            for neighbour in position.cardinalNeighbours {
                guard let neighbourHeight = heightGrid[neighbour],
                      height - neighbourHeight <= 1,
                      visitedPoints.insert(neighbour).inserted
                else { continue }
                
                guard heightGrid[neighbour] != 0 else {
                    return path.count
                }
                
                paths.append(path + [neighbour])
            }
        }
        
        return -1
    }
}
