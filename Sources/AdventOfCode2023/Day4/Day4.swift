import Algorithms
import Foundation
import Utilities

public struct Day4: Day {
    /// The count of matches in each game
    private func parse(_ input: Input) -> [Int] {
        input.lines
            .map { line in
                let numberSets = line
                    .words(byCharactersIn: ":|")
                    .dropFirst()
                    .map { Set($0.words.integers) }
                    
                return numberSets[0]
                    .intersection(numberSets[1])
                    .count
            }
    }
    
    public func part1Solution(for input: Input) -> Int {
        parse(input)
            .map { count in
                guard count > 0 else { return 0 }
                return Int(pow(2.0, Double(count - 1)))
            }
            .sum()
    }
    
    public func part2Solution(for input: Input) -> Int {
        var counts = parse(input)
        
        for index in counts.indices.reversed() {
            counts[index] = counts
                .dropFirst(index + 1)
                .prefix(counts[index])
                .sum()
                + 1
        }
        
        return counts.sum()
    }
}
