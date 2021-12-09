import Algorithms
import Foundation

public struct Day1: Day {

    public func part1Solution(for input: Input) -> String {
        let increasingCount = input.lines
            .integers
            .adjacentPairs()
            .filter { $0.0 < $0.1 }
            .count
        
        return "\(increasingCount)"
    }

    public func part2Solution(for input: Input) -> String {
        let increasingCount = input.lines
            .integers
            .windows(ofCount: 3)
            .map { $0.sum() }
            .adjacentPairs()
            .filter { $0.0 < $0.1 }
            .count

        return "\(increasingCount)"
    }
}
