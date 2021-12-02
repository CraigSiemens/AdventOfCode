import Foundation

public struct Day17: Day {
    public func part1Solution(for input: String = input) -> String {
        let stepSize = input.int!
        var buffer = [0]
        var index = 0
        
        for n in 1...2017 {
            index = (index + stepSize) % buffer.count + 1
            buffer.insert(n, at: index)
        }
        
        return buffer[(index + 1) % buffer.count].description
    }

    public func part2Solution(for input: String = input) -> String {
        let stepSize = input.int!
        var value = 0
        var index = 0
        
        for n in 1...50000000 {
            index = (index + stepSize) % n + 1
            if index == 1 {
                value = n
            }
        }
        
        return value.description
    }
}
