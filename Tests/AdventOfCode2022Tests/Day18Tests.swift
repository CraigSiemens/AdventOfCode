import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day18Tests: XCTestCase {
    let day = Day18()
    
    let smallInput: Input = """
    0,-1,0
    -1,0,0
    1,0,0
    0,0,-1
    0,0,1
    0,1,0
    """
    
    let mediumInput: Input = """
    2,2,2
    1,2,2
    3,2,2
    2,1,2
    2,3,2
    2,2,1
    2,2,3
    2,2,4
    2,2,6
    1,2,5
    3,2,5
    2,1,5
    2,3,5
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: smallInput), 36)
        XCTAssertEqual(day.part1Solution(for: mediumInput), 64)
        XCTAssertEqual(day.part1Solution(), 3374)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: smallInput), 30)
        XCTAssertEqual(day.part2Solution(for: mediumInput), 58)
        XCTAssertEqual(day.part2Solution(), 2010)
    }
}
