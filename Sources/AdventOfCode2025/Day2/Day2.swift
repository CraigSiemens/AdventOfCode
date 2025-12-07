import Algorithms
import Foundation
import Utilities

public struct Day2: Day {
    private func parse(_ input: Input) -> [ClosedRange<Int>] {
        input.commaSeparatedWords
            .map { word in
                let integers = word.words(byCharactersIn: "-").integers
                return integers[0]...integers[1]
            }
    }
    
    public func part1Solution(for input: Input) -> Int {
        invalidCounts(for: input) { _ in
            2...2
        }
    }
    
    public func part2Solution(for input: Input) -> Int {
        invalidCounts(for: input) { digitCount in
            let halfCount = digitCount / 2
            guard halfCount > 0 else { return [] }
            
            return 2...digitCount
        }
    }
    
    private func invalidCounts(
        for input: Input,
        subsequenceRepeatCounts: (_ digitCount: Int) -> any Sequence<Int>
    ) -> Int {
        var total = 0
        
        for range in parse(input) {
            let lowerBoundDigits = range.lowerBound.digits
            let upperBoundDigits = range.upperBound.digits
            let digitCountRange = lowerBoundDigits.count...upperBoundDigits.count
            var seenNumbers: Set<Int> = []
            
            for digitCount in digitCountRange {
                for subsequenceRepeatCount in subsequenceRepeatCounts(digitCount) {
                    let result = digitCount.quotientAndRemainder(dividingBy: subsequenceRepeatCount)
                    guard result.remainder == 0 else { continue }
                    
                    let subsequenceDigitCount = result.quotient
                    
                    let min = if digitCount == digitCountRange.lowerBound {
                        Int(digits: lowerBoundDigits.prefix(subsequenceDigitCount))
                    } else {
                        Int(digits: [1] + Array(repeating: 0, count: subsequenceDigitCount - 1))
                    }
                    
                    let max = if digitCount == digitCountRange.upperBound {
                        Int(digits: upperBoundDigits.prefix(subsequenceDigitCount))
                    } else {
                        Int(digits: Array(repeating: 9, count: subsequenceDigitCount))
                    }
                    
                    for i in min...max {
                        let number = Int(
                            digits: i.digits.cycled(times: subsequenceRepeatCount)
                        )
                        
                        guard range.contains(number),
                              seenNumbers.insert(number).inserted
                        else { continue }
                        
                        total += number
                    }
                }
            }
        }
        
        return total
    }
    
    private func slowPart1Solution(for input: Input) -> Int {
        var total = 0
        for range in parse(input) {
            for i in range {
                let string = "\(i)"
                guard string.count.isMultiple(of: 2) else { continue }
                
                let middleIndex = string.index(string.startIndex, offsetBy: string.count / 2)
                guard string[..<middleIndex] == string[middleIndex...] else { continue }
                
                total += i
            }
        }
        return total
    }
    
    private func slowPart2Solution(for input: Input) -> Int {
        var total = 0
        for range in parse(input) {
            for i in range {
                let string = "\(i)"
                let half = string.count / 2
                guard half > 0 else { continue }
                
                for length in 1...half {
                    guard string.count.isMultiple(of: length) else { continue }
                    
                    let isInvalid = string
                        .chunks(ofCount: length)
                        .adjacentPairs()
                        .allSatisfy { $0 == $1 }
                    
                    guard isInvalid else { continue }
                    
                    total += i
                    break
                }
            }
        }
        return total
    }
}
