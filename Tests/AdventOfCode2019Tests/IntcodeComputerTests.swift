import Testing
@testable import AdventOfCode2019

struct IntcodeComputerTests {
    let computer = IntcodeComputer()
    
    // MARK: 1 - Addition
    @Test func addition() {
        computer.load(.init([1,0,0,0,99]))
        computer.run()
        #expect(computer.memory == [2,0,0,0,99])
    }
    
    @Test func additionWithImmediateParameterMode() {
        computer.load(.init([1101,100,-1,4,0]))
        computer.run()
        #expect(computer.memory == [1101,100,-1,4,99])
    }
    
    // MARK: 2 - Multiplication
    @Test func multiplication() {
        computer.load(.init([2,3,0,3,99]))
        computer.run()
        #expect(computer.memory == [2,3,0,6,99])
        
        computer.load(.init([2,4,4,5,99,0]))
        computer.run()
        #expect(computer.memory == [2,4,4,5,99,9801])
    }
    
    @Test func multiplicationWithImmediateParameterMode() {
        computer.load(.init([1102,3,7,0,99]))
        computer.run()
        #expect(computer.memory == ([21,3,7,0,99]))
        
        computer.load(.init([1102,4,4,5,99,0]))
        computer.run()
        #expect(computer.memory == [1102,4,4,5,99,16])
    }
    
    // MARK: 3 - Read
    @Test func read() {
        computer.load(.init([3,0,99]))
        computer.input = 1001
        computer.run()
        #expect(computer.memory == [1001,0,99])
        
        computer.load(.init([3,0,99]))
        computer.run()
        computer.input = 1001
        #expect(computer.memory == [1001,0,99])
        
        computer.load(.init([3,0,3,1,99]))
        computer.run()
        computer.input = 1001
        computer.input = 1002
        #expect(computer.memory == [1001,1002,3,1,99])
    }
    
    // MARK: 4 - Write
    @Test func write() {
        computer.load(.init([4,3,99,382]))
        computer.run()
        #expect(computer.output == 382)
        #expect(computer.output == nil)
    }
    
    // MARK: 5 - Jump If True
    @Test func jumpIfTrue() {
        var program = [
            5,10,9,
            104,0,
            99,
            104,1,
            99,
            6,
            1
        ]
        computer.load(.init(program))
        computer.run()
        #expect(computer.output == 1)
        
        program[program.count - 1] = 0
        computer.load(.init(program))
        computer.run()
        #expect(computer.output == 0)
    }
    
    @Test func jumpIfTrueWithImmediateParameterMode() {
        var program = [
            1105,1,6,
            104,0,
            99,
            104,1,
            99
        ]
        computer.load(.init(program))
        computer.run()
        #expect(computer.output == 1)
        
        program[1] = 0
        computer.load(.init(program))
        computer.run()
        #expect(computer.output == 0)
    }
    
    // MARK: 6 - Jump If False
    @Test func jumpIfFalse() {
        var program = [
            6,10,9,
            104,0,
            99,
            104,1,
            99,
            6,
            0
        ]
        computer.load(.init(program))
        computer.run()
        #expect(computer.output == 1)
        
        program[program.count - 1] = 1
        computer.load(.init(program))
        computer.run()
        #expect(computer.output == 0)
    }
    
    @Test func jumpIfFalseWithImmediateParameterMode() {
        var program = [
            1106,0,6,
            104,0,
            99,
            104,1,
            99
        ]
        computer.load(.init(program))
        computer.run()
        #expect(computer.output == 1)
        
        program[1] = 1
        computer.load(.init(program))
        computer.run()
        #expect(computer.output == 0)
    }
    
    @Test func jumpProvidedExamples() {
        let isNotZeroPositional = IntcodeProgram([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9])
        
        computer.load(isNotZeroPositional)
        computer.input = 0
        computer.run()
        #expect(computer.output == 0)
        
        computer.load(isNotZeroPositional)
        computer.input = 7
        computer.run()
        #expect(computer.output == 1)
        
        let isNotZeroImmediate = IntcodeProgram([3,3,1105,-1,9,1101,0,0,12,4,12,99,1])
        
        computer.load(isNotZeroImmediate)
        computer.input = 0
        computer.run()
        #expect(computer.output == 0)
        
        computer.load(isNotZeroImmediate)
        computer.input = 7
        computer.run()
        #expect(computer.output == 1)
    }

    // MARK: 7 - Less Than
    @Test func lessThan() {
        var program = [
            7,5,6,7,
            99,
            2,
            3,
            111
        ]
        computer.load(.init(program))
        computer.run()
        #expect(computer.memory.last == 1)
        
        program[1] = 6
        program[2] = 5
        computer.load(.init(program))
        computer.run()
        #expect(computer.memory.last == 0)
    }
    
    @Test func lessThanWithImmediateParameterMode() {
        var program = [
            1107,2,3,5,
            99,
            111
        ]
        computer.load(.init(program))
        computer.run()
        #expect(computer.memory.last == 1)
        
        program[1] = 3
        program[2] = 2
        computer.load(.init(program))
        computer.run()
        #expect(computer.memory.last == 0)
    }
    
    @Test func lessThanProvidedExamples() {
        let lessThan8Positional = IntcodeProgram([3,9,7,9,10,9,4,9,99,-1,8])
        
        computer.load(lessThan8Positional)
        computer.input = 1
        computer.run()
        #expect(computer.output == 1)

        computer.load(lessThan8Positional)
        computer.input = 8
        computer.run()
        #expect(computer.output == 0)

        let lessThan8Immediate = IntcodeProgram([3,3,1107,-1,8,3,4,3,99])
        
        computer.load(lessThan8Immediate)
        computer.input = 1
        computer.run()
        #expect(computer.output == 1)

        computer.load(lessThan8Immediate)
        computer.input = 8
        computer.run()
        #expect(computer.output == 0)
    }
    
    // MARK: 8 - Equal
    @Test func equal() {
        var program = [
            8,5,6,7,
            99,
            2,
            2,
            111
        ]
        computer.load(.init(program))
        computer.run()
        #expect(computer.memory.last == 1)
        
        program[6] = 3
        computer.load(.init(program))
        computer.run()
        #expect(computer.memory.last == 0)
    }
    
    @Test func equalWithImmediateParameterMode() {
        var program = [
            1108,2,2,5,
            99,
            111
        ]
        computer.load(.init(program))
        computer.run()
        #expect(computer.memory.last == 1)
        
        program[2] = 3
        computer.load(.init(program))
        computer.run()
        #expect(computer.memory.last == 0)
    }
    
    @Test func equalProvidedExamples() {
        let equal8Positional = IntcodeProgram([3,9,8,9,10,9,4,9,99,-1,8])
        
        computer.load(equal8Positional)
        computer.input = 1
        computer.run()
        #expect(computer.output == 0)

        computer.load(equal8Positional)
        computer.input = 8
        computer.run()
        #expect(computer.output == 1)
                
        let equal8Immediate = IntcodeProgram([3,3,1108,-1,8,3,4,3,99])
        
        computer.load(equal8Immediate)
        computer.input = 1
        computer.run()
        #expect(computer.output == 0)

        computer.load(equal8Immediate)
        computer.input = 8
        computer.run()
        #expect(computer.output == 1)
    }
    
    @Test func day5Part2ProvidedExample() {
        let program = IntcodeProgram([3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
        1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
        999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99])
        
        computer.load(program)
        computer.input = 7
        computer.run()
        #expect(computer.output == 999)

        computer.load(program)
        computer.input = 8
        computer.run()
        #expect(computer.output == 1000)

        computer.load(program)
        computer.input = 9
        computer.run()
        #expect(computer.output == 1001)
    }
    
    // MARK: 9 - Adjust Relative Base
    
    @Test func day9ProvidedExamples() {
       let program = [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]
        computer.load(.init(program))
        computer.run()
        #expect(computer.allOutput == program)
        
        computer.load(.init("1102,34915192,34915192,7,4,7,99,0"))
        computer.run()
        #expect("\(computer.output!)".count == 16)
        
        computer.load(.init("104,1125899906842624,99"))
        computer.run()
        #expect(computer.output == 1125899906842624)
    }
}
