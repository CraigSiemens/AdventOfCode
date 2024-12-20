import Algorithms
import Foundation
import Utilities

public struct Day4: Day {
    public func part1Solution(for input: Input) -> Int {
        let grid = Grid(input.lines.map(\.characters))
        let match = "XMAS"
        
        let headings: [Point] = Heading.Cardinal.allCases.map(\.point)
        + Heading.Diagonal.allCases.map(\.point)
        
        var count = 0
        
        for point in grid.keys {
            for heading in headings {
                var remaining = match[...]
                var currentPoint = point
                while let character = remaining.first {
                    guard grid[currentPoint] == character else { break }
                    
                    remaining = remaining.dropFirst()
                    currentPoint += heading
                }
                
                if remaining.isEmpty {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    public func part2Solution(for input: Input) -> Int {
        let grid = Grid(input.lines.map(\.characters))
        
        var count = 0
        
        for case (let point, "A") in grid {
            let diagonalNeighbours = point.diagonalNeighbours.compactMap { grid[$0] }
            
            guard diagonalNeighbours.count == 4,
                  diagonalNeighbours.count(where: { $0 == "M" }) == 2,
                  diagonalNeighbours.count(where: { $0 == "S" }) == 2,
                  diagonalNeighbours.contains("SS") || diagonalNeighbours.contains("MM")
            else { continue }
            
            count += 1
        }
        
        return count
    }
}
