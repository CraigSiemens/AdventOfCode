import Foundation

struct Day1: Day {
    public let number: Int = 1
    
    public func part1Solution(for input: String = input) -> String {
        let weight = Input(input).lines
            .compactMap { $0.integer }
            .map { $0 / 3 - 2 }
            .sum()

        return "\(weight)"
    }
    
    public func part2Solution(for input: String = input) -> String {
        let weight = Input(input).lines
            .compactMap { $0.integer }
            .map { (weight) -> Int in
                var totalWeight = 0
                var addedWeight = weight
                repeat {
                    addedWeight = addedWeight / 3 - 2
                    totalWeight += max(0, addedWeight)
                } while addedWeight > 0

                return totalWeight
            }
            .sum()
        
        return "\(weight)"
    }
}
