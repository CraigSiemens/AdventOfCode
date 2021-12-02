import Algorithms
import Foundation

public struct Day1: Day {

    public func part1Solution(for input: String = input) -> String {
        let match = Input(input).lines
            .compactMap { $0.integer }
            .combinations(ofCount: 2)
            .first { $0.reduce(0, +) == 2020 }

        if let match = match {
            return "\(match.reduce(1,*))"
        }
        
        return "not solved"
    }

    public func part2Solution(for input: String = input) -> String {
        let match = Input(input).lines
            .compactMap { $0.integer }
            .combinations(ofCount: 3)
            .first { $0.reduce(0, +) == 2020 }
        
        if let match = match {
            return "\(match.reduce(1, *))"
        }
        
        return "not solved"
    }
}
