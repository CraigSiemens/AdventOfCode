import Algorithms
import Foundation
import Utilities

public struct Day1: Day {
    public func part1Solution(for input: Input) -> Int {
        input
            .lines
            .map { line in
                let numbers = line.integers
                return 10 * numbers.first! + numbers.last!
            }
            .sum()
    }
    
    public func part2Solution(for input: Input) -> Int {
        let words = [
            "one",
            "two",
            "three",
            "four",
            "five",
            "six",
            "seven",
            "eight",
            "nine"
        ]
        let reversedWords = words.map { $0.reversed() }
        
        return input
            .lines
            .map { line in
                let firstNumber = line.indices.lazy
                    .compactMap { index in
                        line[index].wholeNumberValue
                        ?? words.firstIndex(where: line[index...].starts(with:)).map { $0 + 1 }
                    }
                    .first
                
                let reversedLine = line.raw.reversed()
                let lastNumber = reversedLine.indices.lazy
                    .compactMap { index in
                        reversedLine[index].wholeNumberValue
                        ?? reversedWords.firstIndex(where: reversedLine[index...].starts(with:)).map { $0 + 1 }
                    }
                    .first
                
                return 10 * firstNumber! + lastNumber!
            }
            .sum()
    }
}
