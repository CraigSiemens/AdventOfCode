import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day5Tests: XCTestCase {
    let day = Day5()
    
    let input: Input = """
        [D]
    [N] [C]
    [Z] [M] [P]
     1   2   3

    move 1 from 2 to 1
    move 3 from 1 to 3
    move 2 from 2 to 1
    move 1 from 1 to 2
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "CMZ")
        XCTAssertEqual(day.part1Solution(), "WHTLRMZRC")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "MCD")
        XCTAssertEqual(day.part2Solution(), "GMPMLWNMG")
    }
}
