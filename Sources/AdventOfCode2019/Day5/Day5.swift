import Foundation

public struct Day5: Day {
    public let number: Int = 5

    public func part1Solution(for input: String = input) -> String {
        let program = IntcodeProgram(input)
        
        let computer = IntcodeComputer()
        computer.load(program)
        computer.input = 1
        computer.run()
        
        return "\(computer.output!)"
    }

    public func part2Solution(for input: String = input) -> String {
        let program = IntcodeProgram(input)
        
        let computer = IntcodeComputer()
        computer.load(program)
        computer.input = 5
        computer.run()

        return "\(computer.output!)"
    }
}
