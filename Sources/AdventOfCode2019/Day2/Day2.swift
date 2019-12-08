import Foundation

public struct Day2: Day {
    public let number: Int = 2
    
    public func part1Solution(for input: String = input) -> String {
        var program = IntcodeProgram(input)
        program[1] = 12
        program[2] = 2
        
        let computer = IntcodeComputer()
        computer.execute(program)
        
        return "\(computer.memory[0])"
    }
    
    public func part2Solution(for input: String = input) -> String {
        var program = IntcodeProgram(input)
        
        for i in 0..<100 {
            program[1] = i
            for j in 0..<100 {
                program[2] = j
                
                let computer = IntcodeComputer()
                computer.execute(program)

                if computer.memory[0] == 19690720 {
                    return "\(i * 100 + j)"
                }
            }
        }
        
        return "No Solution Found"
    }
}
