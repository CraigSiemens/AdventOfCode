import Foundation

public struct Day2: Day {
    public func part1Solution(for input: Input) -> String {
        var program = IntcodeProgram(input)
        program[1] = 12
        program[2] = 2
        
        let computer = IntcodeComputer()
        computer.load(program)
        computer.run()
        
        return "\(computer.memory[0])"
    }
    
    public func part2Solution(for input: Input) -> String {
        var program = IntcodeProgram(input)
        
        for i in 0..<100 {
            program[1] = i
            for j in 0..<100 {
                program[2] = j
                
                let computer = IntcodeComputer()
                computer.load(program)
                computer.run()
                
                if computer.memory[0] == 19690720 {
                    return "\(i * 100 + j)"
                }
            }
        }
        
        return "No Solution Found"
    }
}
