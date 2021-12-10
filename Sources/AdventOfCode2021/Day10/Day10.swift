import Foundation

public struct Day10: Day {
    let pairs: [Character: Character] = [
        "(": ")",
        "[": "]",
        "{": "}",
        "<": ">"
    ]
    
    public func part1Solution(for input: Input) -> String {
        let scores: [Character: Int] = [
            ")": 3,
            "]": 57,
            "}": 1197,
            ">": 25137
        ]
        
        return input.lines
            .characters
            .map { line -> Int in
                var stack = Array<Character>()
                
                for character in line {
                    if let closing = pairs[character] {
                        stack.append(closing)
                        continue
                    } else {
                        let closing = stack.popLast()!
                        
                        guard character == closing else {
                            return scores[character]!
                        }
                    }
                }
                
                return 0
            }
            .sum()
            .description
    }

    public func part2Solution(for input: Input) -> String {
        let scores: [Character: Int] = [
            ")": 1,
            "]": 2,
            "}": 3,
            ">": 4,
        ]
        
        let lineScores = input.lines
            .characters
            .compactMap { line -> [Character]? in
                var stack = Array<Character>()
                
                for character in line {
                    if let closing = pairs[character] {
                        stack.append(closing)
                    } else {
                        let closing = stack.popLast()!
                        
                        guard character == closing else {
                            return nil
                        }
                    }
                }
                
                return stack
            }
            .map { stack -> Int in
                stack
                    .reversed()
                    .compactMap { scores[$0] }
                    .reduce(into: 0) { (partialResult, score) in
                        partialResult *= 5
                        partialResult += score
                    }
            }
            .sorted()
        
        return lineScores[lineScores.count / 2].description
    }
}
