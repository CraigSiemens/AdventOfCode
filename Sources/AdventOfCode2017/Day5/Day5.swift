import Foundation

public struct Day5: Day {
    public func part1Solution(for input: Input) -> String {
        var offsets = input.lines.integers
        var index = 0
        var jumpCount = 0
        
        while index >= 0 && index < offsets.count {
            let prevIndex = index
            defer { offsets[prevIndex] += 1 }
            
            index += offsets[index]
            jumpCount += 1
        }
        
        return jumpCount.description
    }

    public func part2Solution(for input: Input) -> String {
        var offsets = input.lines.integers
        var index = 0
        var jumpCount = 0
        
        while index >= 0 && index < offsets.count {
            let prevIndex = index
            defer {
                if offsets[prevIndex] >= 3 {
                offsets[prevIndex] -= 1
                } else {
                    offsets[prevIndex] += 1
                }
            }
            
            index += offsets[index]
            jumpCount += 1
        }
        
        return jumpCount.description
    }
}
