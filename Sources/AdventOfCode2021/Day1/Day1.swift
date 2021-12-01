import Algorithms
import Foundation

public struct Day1: Day {
    public let number: Int = 1

    public func part1Solution(for input: String = input) -> String {
        let increasingCount = Input(input).lines
            .integers
            .adjacentPairs()
            .filter { $0.0 < $0.1 }
            .count
        
        return "\(increasingCount)"
    }

    public func part2Solution(for input: String = input) -> String {
        let increasingCount = Input(input).lines
            .integers
            .windows(ofCount: 3)
            .map { $0.sum() }
            .adjacentPairs()
            .filter { $0.0 < $0.1 }
            .count

        return "\(increasingCount)"
    }
}
