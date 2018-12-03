import Foundation

public struct Day2 {
    public init() {}

    func parse(input: String) -> [String] {
        return input.components(separatedBy: .newlines)
    }
    
    func exactCounts(input: String) -> (hasTwo: Bool, hasThree: Bool) {
        var counts: [Character: Int] = [:]
        for c in input {
            counts[c, default: 0] += 1
        }
        
        let uniqueCounts = Set(counts.values)
        return (uniqueCounts.contains(2), uniqueCounts.contains(3))
    }
    
    public func part1Solution(for input: String = input) -> String {
        let counts = parse(input: input)
            .map(exactCounts(input: ))
            .map { ($0.hasTwo ? 1 : 0, $0.hasThree ? 1 : 0) }
            .reduce(into: (0, 0)) { (result, value) in
                result.0 += value.0
                result.1 += value.1
            }
        
        
        return "\(counts.0 * counts.1)"
    }

    public func part2Solution(for input: String = input) -> String {
        return Combinations(from: parse(input: input))
            .lazy
            .compactMap { (combination) -> String? in
                let filtered = zip(combination.0, combination.1)
                    .filter { $0.0 == $0.1 }
                
                guard filtered.count == combination.0.count - 1 else {
                    return nil
                }
                
                return String(filtered.map { $0.0 })
            }
            .first
            ?? "nothing"
    }
}
