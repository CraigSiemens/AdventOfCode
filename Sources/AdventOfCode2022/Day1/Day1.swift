import Foundation
import Utilities

public struct Day1: Day {
    func parse(input: Input) -> [Int] {
        input
            .lines
            .split(separator: "")
            .map { lines in
                lines.integers.sum()
            }
    }
    
    public func part1Solution(for input: Input) -> Int {
        parse(input: input).max()!
    }

    public func part2Solution(for input: Input) -> Int {
        parse(input: input).max(count: 3).sum()
    }
}
