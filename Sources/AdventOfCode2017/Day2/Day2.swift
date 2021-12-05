import Foundation

public struct Day2: Day {    
    public func part1Solution(for input: String = input) -> String {
        input
            .split(separator: "\n")
            .map { line in
                let numbers = line
                    .split(separator: " ")
                    .compactMap { Int($0) }
                return numbers.max()! - numbers.min()!
            }
            .reduce(0, +)
            .description
    }
    
    public func part2Solution(for input: String = input) -> String {
        input
            .split(separator: "\n")
            .map { line in
                let numbers = line
                    .split(separator: " ")
                    .compactMap { Int($0) }
                
                for (xIndex, xValue) in numbers.enumerated() {
                    for (_, yValue) in numbers.enumerated().dropFirst(xIndex + 1) {
                        let (quotient, remainder) = max(xValue, yValue).quotientAndRemainder(dividingBy: min(xValue, yValue))
                        if remainder == 0 { return quotient }
                    }
                }
                
                return .min
            }
            .reduce(0, +)
            .description
    }
}
