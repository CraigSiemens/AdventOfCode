import Foundation
import Utilities

public struct Day1: Day {
    public init() {}
    
    func parse(input: String) -> [Int] {
        return input
            .components(separatedBy: CharacterSet(charactersIn: ",\n"))
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .compactMap { Int($0) }
    }
    
    public func part1Solution(for input: String = input) -> String {
        let value = parse(input: input)
            .sum()
        
        return "\(value)"
    }
    
    public func part2Solution(for input: String = input) -> String {
        var seen = Set<Int>()
        
        let values = sequence(first: parse(input: input), next: { $0 })
            .lazy
            .joined()
        
        var total = 0
        for value in values {
            guard !seen.contains(total) else {
                return "\(total)"
            }
            seen.insert(total)
            total += value
        }
        
        return "never"
    }
}
