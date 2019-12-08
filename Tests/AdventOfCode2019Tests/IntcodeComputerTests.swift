import XCTest
@testable import AdventOfCode2019

final class IntcodeComputerTests: XCTestCase {
    let computer = IntcodeComputer()
    
    // MARK: 1 - Addition
    func testAddition() {
        computer.execute(.init([1,0,0,0,99]))
        XCTAssertEqual(computer.memory, [2,0,0,0,99])
    }
    
    func testAdditionWithImmediateParameterMode() {
        computer.execute(.init([1101,100,-1,4,0]))
        XCTAssertEqual(computer.memory, [1101,100,-1,4,99])
    }
    
    // MARK: 2 - Multiplication
    func testMultiplication() {
        computer.execute(.init([2,3,0,3,99]))
        XCTAssertEqual(computer.memory, [2,3,0,6,99])
        
        computer.execute(.init([2,4,4,5,99,0]))
        XCTAssertEqual(computer.memory, [2,4,4,5,99,9801])
    }
    
    func testMultiplicationWithImmediateParameterMode() {
        computer.execute(.init([1102,3,7,0,99]))
        XCTAssertEqual(computer.memory, ([21,3,7,0,99]))
        
        computer.execute(.init([1102,4,4,5,99,0]))
        XCTAssertEqual(computer.memory, [1102,4,4,5,99,16])
    }
    
    // MARK: 3 - Read
    func testRead() {
        computer.execute(.init([3,0,99]), input: [1001])
        XCTAssertEqual(computer.memory, [1001,0,99])
    }
    
    // MARK: 4 - Write
    func testWrite() {
        XCTAssertEqual(computer.execute(.init([4,3,99,382])), [382])
    }
    
    // MARK: 5 - Jump If True
    func testJumpIfTrue() {
        var program = [
            5,10,9,
            104,0,
            99,
            104,1,
            99,
            6,
            1
        ]
        XCTAssertEqual(computer.execute(.init(program)), [1])
        
        program[program.count - 1] = 0
        XCTAssertEqual(computer.execute(.init(program)), [0])
    }
    
    func testJumpIfTrueWithImmediateParameterMode() {
        var program = [
            1105,1,6,
            104,0,
            99,
            104,1,
            99
        ]
        XCTAssertEqual(computer.execute(.init(program)), [1])
        
        program[1] = 0
        XCTAssertEqual(computer.execute(.init(program)), [0])
    }
    
    // MARK: 6 - Jump If False
    func testJumpIfFalse() {
        var program = [
            6,10,9,
            104,0,
            99,
            104,1,
            99,
            6,
            0
        ]
        XCTAssertEqual(computer.execute(.init(program)), [1])
        
        program[program.count - 1] = 1
        XCTAssertEqual(computer.execute(.init(program)), [0])
    }
    
    func testJumpIfFalseWithImmediateParameterMode() {
        var program = [
            1106,0,6,
            104,0,
            99,
            104,1,
            99
        ]
        XCTAssertEqual(computer.execute(.init(program)), [1])
        
        program[1] = 1
        XCTAssertEqual(computer.execute(.init(program)), [0])
    }
    
    func testJumpProvidedExamples() {
        let isNotZeroPositional = IntcodeProgram([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9])
        
        XCTAssertEqual(computer.execute(isNotZeroPositional, input: [0]), [0])
        XCTAssertEqual(computer.execute(isNotZeroPositional, input: [7]), [1])
        
        let isNotZeroImmediate = IntcodeProgram([3,3,1105,-1,9,1101,0,0,12,4,12,99,1])
        
        XCTAssertEqual(computer.execute(isNotZeroImmediate, input: [0]), [0])
        XCTAssertEqual(computer.execute(isNotZeroImmediate, input: [7]), [1])
    }

    // MARK: 7 - Less Than
    func testLessThan() {
        var program = [
            7,5,6,7,
            99,
            2,
            3,
            111
        ]
        computer.execute(.init(program))
        XCTAssertEqual(computer.memory.last, 1)
        
        program[1] = 6
        program[2] = 5
        computer.execute(.init(program))
        XCTAssertEqual(computer.memory.last, 0)
    }
    
    func testLessThanWithImmediateParameterMode() {
        var program = [
            1107,2,3,5,
            99,
            111
        ]
        computer.execute(.init(program))
        XCTAssertEqual(computer.memory.last, 1)
        
        program[1] = 3
        program[2] = 2
        computer.execute(.init(program))
        XCTAssertEqual(computer.memory.last, 0)
    }
    
    func testLessThanProvidedExamples() {
        let lessThan8Positional = IntcodeProgram([3,9,7,9,10,9,4,9,99,-1,8])
        XCTAssertEqual(computer.execute(lessThan8Positional, input: [1]), [1])
        XCTAssertEqual(computer.execute(lessThan8Positional, input: [8]), [0])
        
        let lessThan8Immediate = IntcodeProgram([3,3,1107,-1,8,3,4,3,99])
        XCTAssertEqual(computer.execute(lessThan8Immediate, input: [1]), [1])
        XCTAssertEqual(computer.execute(lessThan8Immediate, input: [8]), [0])
    }
    
    // MARK: 8 - Equal
    func testEqual() {
        var program = [
            8,5,6,7,
            99,
            2,
            2,
            111
        ]
        computer.execute(.init(program))
        XCTAssertEqual(computer.memory.last, 1)
        
        program[6] = 3
        computer.execute(.init(program))
        XCTAssertEqual(computer.memory.last, 0)
    }
    
    func testEqualWithImmediateParameterMode() {
        var program = [
            1108,2,2,5,
            99,
            111
        ]
        computer.execute(.init(program))
        XCTAssertEqual(computer.memory.last, 1)
        
        program[2] = 3
        computer.execute(.init(program))
        XCTAssertEqual(computer.memory.last, 0)
    }
    
    func testEqualProvidedExamples() {
        let equal8Positional = IntcodeProgram([3,9,8,9,10,9,4,9,99,-1,8])
        XCTAssertEqual(computer.execute(equal8Positional, input: [1]), [0])
        XCTAssertEqual(computer.execute(equal8Positional, input: [8]), [1])
        
        let equal8Immediate = IntcodeProgram([3,3,1108,-1,8,3,4,3,99])
        XCTAssertEqual(computer.execute(equal8Immediate, input: [1]), [0])
        XCTAssertEqual(computer.execute(equal8Immediate, input: [8]), [1])
    }
    
    func testDay5Part2ProvidedExample() {
        let program = IntcodeProgram([3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
        1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
        999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99])
        
        XCTAssertEqual(computer.execute(program, input: [7]), [999])
        XCTAssertEqual(computer.execute(program, input: [8]), [1000])
        XCTAssertEqual(computer.execute(program, input: [9]), [1001])
    }
}
