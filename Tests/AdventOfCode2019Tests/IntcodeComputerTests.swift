import XCTest
@testable import AdventOfCode2019

final class IntcodeComputerTests: XCTestCase {
    func testAddition() {
        XCTAssertEqual(IntcodeComputer.execute(program: [1,0,0,0,99]),
                       [2,0,0,0,99])
    }
    
    func textMultiplication() {
        XCTAssertEqual(IntcodeComputer.execute(program: [2,3,0,3,99]),
                       [2,3,0,6,99])
        XCTAssertEqual(IntcodeComputer.execute(program: [2,4,4,5,99,0]),
                       [2,4,4,5,99,9801])
    }
    
    func testEvaluate() {
        XCTAssertEqual(IntcodeComputer.evaluate(program: [1,9,10,3,2,3,11,0,99,30,40,50]), 3500)
        XCTAssertEqual(IntcodeComputer.evaluate(program: [1,1,1,4,99,5,6,0,99]), 30)
    }
}
