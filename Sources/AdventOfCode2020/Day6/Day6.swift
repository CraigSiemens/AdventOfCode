import Foundation

public struct Day6: Day {
    public let number: Int = 6

    public func part1Solution(for input: String = input) -> String {
        let result = input
            .components(separatedBy: "\n\n")
            .map { Set($0.filter(CharacterSet.letters.contains)) }
            .map { $0.count }
            .reduce(0, +)
        
        return "\(result)"
    }

    public func part2Solution(for input: String = input) -> String {
        let result = input
            .components(separatedBy: "\n\n")
            .map { (group) -> Int in
                let sets = group
                    .components(separatedBy: "\n")
                    .map { Set($0) }
                    
                    return sets
                        .reduce(into: sets.first!) { $0.formIntersection($1) }
                        .count
            }
            .reduce(0, +)
        
        return "\(result)"
    }
}
