import Algorithms
import Foundation
import Utilities

public struct Day1: Day {
    public func part1Solution(for input: Input) -> Int {
        let input = input
            .lines
            .map(\.words.integers)
        
        let list1 = input.map(\.[0]).sorted()
        let list2 = input.map(\.[1]).sorted()
        
        return zip(list1, list2)
            .map { abs($0 - $1) }
            .sum()
    }
    
    public func part2Solution(for input: Input) -> Int {
        let input = input
            .lines
            .map(\.words.integers)
        
        let list1 = input.map(\.[0]).sorted()
        let list2 = Dictionary(counting: input.map(\.[1]))
        
        return list1
            .map { $0 * list2[$0, default: 0] }
            .sum()
    }
}
