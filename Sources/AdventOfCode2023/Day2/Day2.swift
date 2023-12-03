import Algorithms
import Foundation
import Utilities

public struct Day2: Day {
    /// Games
    /// - Turns
    ///   - Color: Count
    private func parse(_ input: Input) -> [[[String: Int]]] {
        input.lines
            .map { line in
                line.words(byCharactersIn: ";:")
                    .dropFirst() // Game #
                    .map { turn -> [String: Int] in
                        return turn
                            .words(byCharactersIn: ", ")
                            .chunks(ofCount: 2)
                            .reduce(into: [:]) { draw, pair in
                                draw[pair.last!.raw] = pair.first?.integer
                            }
                    }
            }
    }
    
    public func part1Solution(for input: Input) -> Int {
        parse(input)
            .enumerated()
            .filter { _, turns in
                turns.allSatisfy { turn in
                    turn["red", default: 0] <= 12
                    && turn["green", default: 0] <= 13
                    && turn["blue", default: 0] <= 14
                }
            }
            .map { $0.offset + 1}
            .sum()
    }
    
    public func part2Solution(for input: Input) -> Int {
        parse(input)
            .map { turns in
                turns
                    .reduce(into: [:]) { max, next in
                        max.merge(next, uniquingKeysWith: Swift.max)
                    }
                    .values
                    .product()
            }
            .sum()
    }
}
