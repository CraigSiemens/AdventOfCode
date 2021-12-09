import Foundation

public struct Day2: Day {    
    public func part1Solution(for input: Input) -> String {
        input
            .lines
            .map { line in
                let numbers = line.words.integers
                return numbers.max()! - numbers.min()!
            }
            .reduce(0, +)
            .description
    }
    
    public func part2Solution(for input: Input) -> String {
        input
            .lines
            .map { line in
                let numbers = line.words.integers
                
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
