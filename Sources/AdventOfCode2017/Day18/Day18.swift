import Foundation

public struct Day18: Day {
    class Program {
        let id: Int
        var registers: [String: Int] = [:]
        var instructions: [(Program) -> Void]
        
        var index = 0
        var queue: [Int] = []
        var sendCount = 0
        
        var destProgram: Program!
        
        init(id: Int, input: String) {
            self.id = id
            registers["p"] = id
            instructions = Self.parseAssembly(input: input)
        }
        
        func runStep() -> Bool {
            guard index < instructions.count else { return false }
            
            let prevIndex = index
            instructions[index](self)
            
            return index != prevIndex
        }
        
        static func parseAssembly(input: String) -> [(Program) -> Void] {
            return input
                .components(separatedBy: "\n")
                .filter { !$0.isEmpty }
                .map { parseInstruction(line: $0) }
        }
        
        static func parseInstruction(line: String) -> (Program) -> Void {
            let parts = line.components(separatedBy: .whitespaces)
            
            switch parts[0] {
            case "set":
                return { (program) in
                    program.registers[parts[1]] = Int(parts[2]) ?? program.registers[parts[2], default: 0]
                    program.index += 1
                }
            case "add":
                return { (program) in
                    program.registers[parts[1], default: 0] += Int(parts[2]) ?? program.registers[parts[2], default: 0]
                    program.index += 1
                }
            case "mul":
                return { (program) in
                    program.registers[parts[1], default: 0] *= Int(parts[2]) ?? program.registers[parts[2], default: 0]
                    program.index += 1
                }
            case "mod":
                return { (program) in
                    program.registers[parts[1], default: 0] %= Int(parts[2]) ?? program.registers[parts[2], default: 0]
                    program.index += 1
                }
            case "snd":
                return { (program) in
                    program.destProgram.queue.append(Int(parts[1]) ?? program.registers[parts[1], default: 0])
                    
                    program.index += 1
                    program.sendCount += 1
                }
            case "rcv":
                return { (program) in
                    guard !program.queue.isEmpty else { return }

                    program.registers[parts[1]] = program.queue.removeFirst()
                    program.index += 1
                }
            case "jgz":
                return { (program) in
                    guard Int(parts[1]) ?? program.registers[parts[1], default: 0] > 0 else {
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

    }
    
    public func part1Solution(for input: String = input) -> String {
        let p0 = Program(id: 0, input: input)
        let p1 = Program(id: 1, input: "")
        
        p0.destProgram = p1
        p1.destProgram = p0
        
        while p0.runStep() {}
        
        return p1.queue.last!.description
    }

    public func part2Solution(for input: String = input) -> String {
        let p0 = Program(id: 0, input: input)
        let p1 = Program(id: 1, input: input)
        
        p0.destProgram = p1
        p1.destProgram = p0
        
        while p0.runStep() || p1.runStep() { }
        
        return p1.sendCount.description
    }
}
