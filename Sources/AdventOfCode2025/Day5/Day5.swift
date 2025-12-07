import Algorithms
import Foundation
import Utilities

public struct Day5: Day {
    public func part1Solution(for input: Input) -> Int {
        let parts = input.lines.split { $0.count == 0 }
        
        let ranges = parts[0].map { line in
            let parts = line.words(byCharactersIn: "-").integers
            return parts[0]...parts[1]
        }
        let rangeSet = IndexRangeSet(ranges: ranges)
        
        let ingredients = parts[1].integers
        
        var count = 0
        
        for ingredient in ingredients {
            if rangeSet.contains(ingredient) {
                count += 1
            }
        }
        
        return count
    }
    
    public func part2Solution(for input: Input) -> Int {
        let parts = input.lines.split { $0.count == 0 }
        
        let ranges = parts[0].map { line in
            let parts = line.words(byCharactersIn: "-").integers
            return parts[0]...parts[1]
        }
        return IndexRangeSet(ranges: ranges)
            .map(\.count)
            .sum()
    }
}
