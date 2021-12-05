import Foundation

public struct Day23: Day {
    public func part1Solution(for input: String = input) -> String {
        class Program {
            let id: Int
            var registers: [String: Int] = [:]
            var instructions: [(Program) -> Void]
            
            var index = 0
            var queue: [Int] = []
            var mulCount = 0
            
            var destProgram: Program!
            
            init(id: Int, input: String) {
                self.id = id
                registers["p"] = id
                instructions = parseAssembly(input: input)
            }
            
            func runStep() -> Bool {
                guard index < instructions.count else { return false }
                
                let prevIndex = index
                instructions[index](self)
                
                return index != prevIndex
            }
        }

        typealias Registers = [String: Int]

        func parseInstruction(line: String) -> (Program) -> Void {
            let parts = line.components(separatedBy: .whitespaces)
            
            switch parts[0] {
            case "set":
                return { (program) in
                    program.registers[parts[1]] = Int(parts[2]) ?? program.registers[parts[2], default: 0]
                    program.index += 1
                }
            case "sub":
                return { (program) in
                    program.registers[parts[1], default: 0] -= Int(parts[2]) ?? program.registers[parts[2], default: 0]
                    program.index += 1
                }
            case "mul":
                return { (program) in
                    program.registers[parts[1], default: 0] *= Int(parts[2]) ?? program.registers[parts[2], default: 0]
                    program.index += 1
                    program.mulCount += 1
                }
            case "jnz":
                return { (program) in
                    guard Int(parts[1]) ?? program.registers[parts[1], default: 0] != 0 else {
                        program.index += 1
                        return
                    }
                    
                    program.index += Int(parts[2]) ?? program.registers[parts[2], default: 0]
                }
            default:
                return { _ in print("UNKNOWN:", line) }
            }
            
            //    snd X plays a sound with a frequency equal to the value of X.
            //    set X Y sets register X to the value of Y.
            //    add X Y increases register X by the value of Y.
            //    mul X Y sets register X to the result of multiplying the value contained in register X by the value of Y.
            //    mod X Y sets register X to the remainder of dividing the value contained in register X by the value of Y (that is, it sets X to the result of X modulo Y).
            //    rcv X recovers the frequency of the last sound played, but only when the value of X is not zero. (If it is zero, the command does nothing.)
            //    jgz X Y jumps with an offset of the value of Y, but only if the value of X is greater than zero. (An offset of 2 skips the next instruction, an offset of -1 jumps to the previous instruction, and so on.)
        }

        func parseAssembly(input: String) -> [(Program) -> Void] {
            return input
                .components(separatedBy: "\n")
                .filter { !$0.isEmpty }
                .map { parseInstruction(line: $0) }
        }

        let p = Program(id: 0, input: input)
        
        while p.runStep() {}
        
        return p.mulCount.description
    }

    public func part2Solution(for input: String = input) -> String {
        var notPrimeCount = 0
        for b in stride(from: 108100, to: 125100, by: 17) {
            for i in 2..<b {
                if b % i == 0 {
                    notPrimeCount += 1
                    break
                }
            }
        }
        return (notPrimeCount + 1).description
    }
}
