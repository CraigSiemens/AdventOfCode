import Foundation

struct Day1: Day {
    func parse(input: Input) -> [Int] {
        return input
            .words(by: ", ")
            .integers
    }
    
    public func part1Solution(for input: Input) -> String {
        let value = parse(input: input)
            .sum()
        
        return "\(value)"
    }
    
    public func part2Solution(for input: Input) -> String {
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
