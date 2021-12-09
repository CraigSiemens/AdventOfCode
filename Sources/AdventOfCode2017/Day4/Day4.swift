import Foundation

public struct Day4: Day {    
    public func part1Solution(for input: Input) -> String {
        input
            .lines
            .filter { line in
                let words = line.words
                let set = Set(words)
                
                return words.count == set.count
            }
            .count
            .description
    }
    
    public func part2Solution(for input: Input) -> String {
        input
            .lines
            .filter { line in
                let words = line.words.map { String($0.raw.sorted()) }
                let set = Set(words)
                
                return words.count == set.count
            }
            .count
            .description
    }
}
