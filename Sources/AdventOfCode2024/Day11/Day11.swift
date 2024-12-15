import Algorithms
import Foundation
import Utilities

public struct Day11: Day {
    public func part1Solution(for input: Input) -> Int {
        countStones(for: input, after: 25)
    }
    
    public func part2Solution(for input: Input) -> Int {
        countStones(for: input, after: 75)
    }
    
    private func countStones(for input: Input, after times: Int) -> Int {
        struct CacheKey: Hashable {
            let stone: Int
            let times: Int
        }
        
        var cache: [CacheKey: Int] = [:]
        
        func count(of stone: Int, after times: Int) -> Int {
            guard times > 0 else { return 1 }
            
            let cacheKey = CacheKey(stone: stone, times: times)
            if let result = cache[cacheKey] {
                return result
            }
            
            let result: Int
            
            if stone == 0 {
                result = count(of: 1, after: times - 1)
            } else if stone.digitCount.isMultiple(of: 2) {
                let half = stone.digitCount / 2
                let parts = stone.quotientAndRemainder(
                    dividingBy: Int(pow(10.0, Double(half)))
                )
                
                result = count(of: parts.quotient, after: times - 1)
                + count(of: parts.remainder, after: times - 1)
            } else {
                result = count(of: stone * 2024, after: times - 1)
            }
            
            cache[cacheKey] = result
            return result
        }
        
        return input.words.integers.map { count(of: $0, after: times) }.sum()
    }
}
