import Foundation

public struct Day5: Day {
    public let number: Int = 5

    public func part1Solution(for input: String = input) -> String {
        let program = IntcodeProgram(input)
        let computer = IntcodeComputer()
        let output = computer.execute(program,
                                      input: [1])
        
        return "\(output.last!)"
    }

    public func part2Solution(for input: String = input) -> String {
        let program = IntcodeProgram(input)
        let computer = IntcodeComputer()
        let output = computer.execute(program,
                                      input: [5])
        
        return "\(output.last!)"
    }
}
