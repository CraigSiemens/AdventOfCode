import Algorithms
import Foundation
import Utilities

public struct Day6: Day {
    public func part1Solution(for input: Input) -> Int {
        input.characters
            .windows(ofCount: 4)
            .first(where: \.allUnique)!
            .endIndex
    }
    
    public func part2Solution(for input: Input) -> Int {
        input.characters
            .windows(ofCount: 14)
            .first(where: \.allUnique)!
            .endIndex
    }
}
