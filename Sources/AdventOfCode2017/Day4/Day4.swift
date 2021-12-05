import Foundation

public struct Day4: Day {    
    public func part1Solution(for input: String = input) -> String {
        input
            .split(separator: "\n")
            .filter { line in
                let words = line.split(separator: " ")
                let set = Set(words)
                
                return words.count == set.count
            }
            .count
            .description
    }
    
    public func part2Solution(for input: String = input) -> String {
        input
            .split(separator: "\n")
            .filter { line in
                let words = line.split(separator: " ").map { String($0.sorted()) }
                let set = Set(words)
                
                return words.count == set.count
            }
            .count
            .description
    }
}
