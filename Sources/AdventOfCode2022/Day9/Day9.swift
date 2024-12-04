import Algorithms
import Foundation
import Utilities

public struct Day9: Day {
    func solve(for input: Input, knots: Int) -> Int {
        var knots = Array(repeating: Point.zero, count: knots)
        var visitedPoints: Set<Point> = [.zero]
        
        for line in input.lines.map(\.words) {
            let heading = Heading.Cardinal(string: line[0].raw)
            
            for _ in 0..<line[1].int! {
                knots[0] = knots[0].moved(heading)
                
                for (i, j) in knots.indices.adjacentPairs() {
                    if knots[i] != knots[j],
                       !knots[i].isNeighbour(with: knots[j]) {
                        knots[j] += (knots[i] - knots[j]).signum
                    }
                }
                
                visitedPoints.insert(knots.last!)
            }
        }
        
        return visitedPoints.count
    }
    
    public func part1Solution(for input: Input) -> Int {
        solve(for: input, knots: 2)
    }

    public func part2Solution(for input: Input) -> Int {
        solve(for: input, knots: 10)
    }
}

private extension Heading.Cardinal {
    init(string: String) {
        switch string {
        case "U": self = .north
        case "D": self = .south
        case "L": self = .west
        case "R": self = .east
        default: fatalError()
        }
    }
}
