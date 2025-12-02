import Algorithms
import Foundation
import Utilities

public struct Day1: Day {
    private func parse(input: Input) -> [Int] {
        input.lines
            .map { line in
                let amount = Int(line.raw.dropFirst())!
                switch line.first {
                case "L":
                    return -amount
                case "R":
                    return amount
                default:
                    fatalError()
                }
            }
    }
    
    public func part1Solution(for input: Input) -> Int {
        var position = 50
        var zeroCount = 0
        
        for amount in parse(input: input) {
            position += amount
            position %= 100
            if position < 0 {
                position += 100
            }
            
            if position == 0 {
                zeroCount += 1
            }
        }
        
        return zeroCount
    }
    
    public func part2Solution(for input: Input) -> Int {
        var position = 50
        var zeroCount = 0
        
        for amount in parse(input: input) {
            var remainingAmount = amount
            let result = remainingAmount.quotientAndRemainder(dividingBy: 100)
            remainingAmount -= result.quotient * 100
            zeroCount += abs(result.quotient)
            
            let wasZero = position == 0
            position += result.remainder
            
            switch position {
            case 0:
                zeroCount += 1
            case ..<0:
                position += 100
                if !wasZero {
                    zeroCount += 1
                }
            case 100...:
                position -= 100
                zeroCount += 1
            default:
                break
            }
        }
        
        return zeroCount
    }
}
