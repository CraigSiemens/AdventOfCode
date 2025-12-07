import Algorithms
import Foundation
import Utilities

public struct Day6: Day {
    public func part1Solution(for input: Input) -> Int {
        let lines = input.lines
        let numbers = lines.dropLast().map(\.words.integers)
        let operators = lines.last!.words
        
        var total = 0
        
        for i in operators.indices {
            switch operators[i] {
            case "+":
                total += numbers.map(\.[i]).reduce(0, +)
            case "*":
                total += numbers.map(\.[i]).reduce(1, *)
            default:
                fatalError()
            }
        }
        
        return total
    }
    
    public func part2Solution(for input: Input) -> Int {
        let lines = input.lines
        
        var total = 0
        var numbers: [Int] = []
        
        for i in lines.first!.indices.reversed() {
            let digits = lines.map(\.[i]).integers
            if !digits.isEmpty {
                numbers.append(Int(digits: digits))
            }
            
            switch lines.last![i] {
            case "+":
                total += numbers.reduce(0, +)
                numbers = []
            case "*":
                total += numbers.reduce(1, *)
                numbers = []
            default:
                break
            }
        }
        
        return total
    }
}
