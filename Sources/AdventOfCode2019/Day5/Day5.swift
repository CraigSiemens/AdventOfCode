import Foundation

public struct Day5: Day {

    public func part1Solution(for input: Input) -> String {
        let program = IntcodeProgram(input)
        
        let computer = IntcodeComputer()
        computer.load(program)
        computer.input = 1
        computer.run()
        
        return "\(computer.allOutput.last!)"
    }

    public func part2Solution(for input: Input) -> String {
        let program = IntcodeProgram(input)
        
        let computer = IntcodeComputer()
        computer.load(program)
        computer.input = 5
        computer.run()

        return "\(computer.allOutput.last!)"
    }
}
