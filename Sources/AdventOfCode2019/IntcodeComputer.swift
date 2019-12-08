import Foundation

class IntcodeComputer {
    var memory: [Int] = []
    
    private func value(param: Int, mode: Int) -> Int {
        switch mode {
        case 0: // Position
            return memory[memory[param]]
        case 1: // Immediate
            return memory[param]
        default:
            fatalError("Unknown Parameter Mode")
        }
    }
    
    @discardableResult
    func execute(_ program: IntcodeProgram, input: [Int] = []) -> [Int] {
        memory = program.memory
        
        var inputIterator = input.makeIterator()
        var output: [Int] = []
        
        var instructionPointer = 0
        
        runLoop: while instructionPointer <= memory.count {
            let instructionSize: Int
            
            let opcode = memory[instructionPointer] % 100
            var parameterModes = DigitsSequence(number: memory[instructionPointer], isInfinite: true)
                .dropFirst(2).makeIterator()
            
            switch opcode {
            case 1: // Addition
                instructionSize = 4
                memory[memory[instructionPointer+3]]
                    = value(param: instructionPointer+1,
                            mode: parameterModes.next()!)
                    + value(param: instructionPointer+2,
                        mode: parameterModes.next()!)
            case 2: // Multiply
                instructionSize = 4
                memory[memory[instructionPointer+3]]
                    = value(param: instructionPointer+1,
                            mode: parameterModes.next()!)
                    * value(param: instructionPointer+2,
                        mode: parameterModes.next()!)
            case 3: // Read
                guard let input = inputIterator.next() else {
                    fatalError("Missing Input")
                }
                
                instructionSize = 2
                memory[memory[instructionPointer+1]] = input
            case 4: // Write
                instructionSize = 2
                output.append(value(param: instructionPointer+1,
                                    mode: parameterModes.next()!))
            case 5: // jump if true
                if value(param: instructionPointer+1,
                         mode: parameterModes.next()!) != 0 {
                    instructionSize = 0
                    instructionPointer = value(param: instructionPointer+2,
                                               mode: parameterModes.next()!)
                } else {
                    instructionSize = 3
                }
            case 6: // jump if false
                if value(param: instructionPointer+1,
                         mode: parameterModes.next()!) == 0 {
                    instructionSize = 0
                    instructionPointer = value(param: instructionPointer+2,
                                               mode: parameterModes.next()!)
                } else {
                    instructionSize = 3
                }
            case 7: // less than
                instructionSize = 4
                
                let v1 = value(param: instructionPointer+1,
                               mode: parameterModes.next()!)
                let v2 = value(param: instructionPointer+2,
                               mode: parameterModes.next()!)
                
                memory[memory[instructionPointer+3]] = v1 < v2 ? 1 : 0
            case 8: // equals
                instructionSize = 4
                
                let v1 = value(param: instructionPointer+1,
                               mode: parameterModes.next()!)
                let v2 = value(param: instructionPointer+2,
                               mode: parameterModes.next()!)
                
                memory[memory[instructionPointer+3]] = v1 == v2 ? 1 : 0
            case 99: // Finished
                break runLoop
            default:
                fatalError("Unknown Intcode")
            }
            
            instructionPointer += instructionSize
        }
        
        return output
    }
}
