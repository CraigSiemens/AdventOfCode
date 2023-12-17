import Algorithms
import Foundation
import Utilities

public struct Day11: Day {
    public func part1Solution(for input: Input) -> Int {
        solution(for: input, expansion: 2)
    }
    
    public func part2Solution(for input: Input) -> Int {
        solution(for: input, expansion: 1000000)
    }
    
    func solution(for input: Input, expansion: Int) -> Int {
        let grid = Grid(input.lines.characters) { _, input in
            input == "." ? nil : ()
        }
        
        let range = grid.keys.pointRange()
        
        var xSpace = IndexRangeSet(ranges: [range.x])
        var ySpace = IndexRangeSet(ranges: [range.y])
        
        for point in grid.keys {
            xSpace.remove(point.x)
            ySpace.remove(point.y)
        }
        
        return grid.keys
            .sorted()
            .combinations(ofCount: 2)
            .map { combination in
                let range = combination.pointRange()
                
                return combination[0].manhattanDistance(to: combination[1])
                + xSpace.map { $0.overlaps(range.x) ? $0.count : 0 }.sum() * (expansion - 1)
                + ySpace.map { $0.overlaps(range.y) ? $0.count : 0 }.sum() * (expansion - 1)
            }
            .sum()
    }
}
