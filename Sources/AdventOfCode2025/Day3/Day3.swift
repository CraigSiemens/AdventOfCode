import Algorithms
import Foundation
import Utilities

public struct Day3: Day {
    private func parse(input: Input) -> [[Int]] {
        input.lines.map(\.integers)
    }
    
    public func part1Solution(for input: Input) -> Int {
        total(for: parse(input: input), count: 2)
    }
    
    public func part2Solution(for input: Input) -> Int {
        total(for: parse(input: input), count: 12)
    }
    
    private func total(for batteryBanks: [[Int]], count: Int) -> Int {
        var total = 0
        
        for batteryBank in batteryBanks {
            var batteries = Array(repeating: 0, count: count)
            var batteriesDropFirstCount = 0
            
            for n in 0..<count {
                let indices = batteryBank.indices
                    .dropFirst(batteriesDropFirstCount)
                    .dropLast(count - n - 1)
                
                for i in indices {
                    if batteryBank[i] > batteries[n] {
                        batteries[n] = batteryBank[i]
                        batteriesDropFirstCount = i + 1
                    }
                }
            }
            
            total += Int(digits: batteries)
        }
        
        return total
    }
}
