import Foundation

public struct Day1: Day {
    public func part1Solution(for input: String = input) -> String {
        let numbers = input.compactMap { Int("\($0)") }
        guard numbers.count == input.count else { return "" }
        
        var matches: [Int] = []
        var prevNumber = numbers.last
        
        for number in numbers {
            if prevNumber == number {
                matches.append(number)
            }
            prevNumber = number
        }
        
        return "\(matches.sum())"

    }

    public func part2Solution(for input: String = input) -> String {
        let numbers = input.compactMap { Int("\($0)") }
        guard numbers.count == input.count else { return "" }
        
        var matches: [Int] = []
        
        for (index, number) in numbers.enumerated() {
            if numbers[(index + numbers.count/2) % numbers.count] == number {
                matches.append(number)
            }
        }
        
        return "\(matches.sum())"
    }
}
