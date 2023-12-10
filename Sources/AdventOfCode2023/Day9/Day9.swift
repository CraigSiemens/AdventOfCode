import Algorithms
import Foundation
import Utilities

public struct Day9: Day {
    public func part1Solution(for input: Input) -> Int {
        input.lines
            .map(\.words.integers)
            .map { values in
                var sequences = [values]
                
                while let last = sequences.last,
                      !last.allSatisfy({ $0 == 0 }) {
                    sequences.append(
                        last.adjacentPairs()
                            .map { $1 - $0 }
                    )
                }
                
                return sequences.compactMap(\.last).sum()
            }
            .sum()
    }
    
    public func part2Solution(for input: Input) -> Int {
        input.lines
            .map(\.words.integers)
            .map { values in
                var sequences = [values]
                
                while let last = sequences.last,
                      !last.allSatisfy({ $0 == 0 }) {
                    sequences.append(
                        last.adjacentPairs()
                            .map { $1 - $0 }
                    )
                }
                
                return sequences.compactMap(\.first).enumerated()
                    .map { $0.element * ($0.offset.isMultiple(of: 2) ? 1 : -1) }
                    .sum()
            }
            .sum()
    }
}
