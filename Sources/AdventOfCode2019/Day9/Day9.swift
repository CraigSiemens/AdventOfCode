import Foundation

public struct Day9: Day {

    public func part1Solution(for input: String = input) -> String {
        let computer = IntcodeComputer()
        computer.load(.init(input))
        computer.input = 1
        computer.run()
        
        return "\(computer.allOutput.last!)"
    }

    public func part2Solution(for input: String = input) -> String {
        let computer = IntcodeComputer()
        computer.load(.init(input))
        computer.input = 2
        computer.run()
        
        return "\(computer.allOutput.last!)"
    }
}
