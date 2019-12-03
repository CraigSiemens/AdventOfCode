import Foundation

public struct Day2: Day {
    public let number: Int = 2
    
    public func part1Solution(for input: String = input) -> String {
        var program = input
            .components(separatedBy: ",")
            .integers
        
        program[1] = 12
        program[2] = 2
        
        return "\(IntcodeComputer.evaluate(program: program))"
    }
    
    public func part2Solution(for input: String = input) -> String {
        var program = input
            .components(separatedBy: ",")
            .integers
        
        for i in 0..<100 {
            program[1] = i
            for j in 0..<100 {
                program[2] = j
                
                if IntcodeComputer.evaluate(program: program) == 19690720 {
                    return "\(i * 100 + j)"
                }
            }
        }
        
        return "No Solution Found"
    }
}
