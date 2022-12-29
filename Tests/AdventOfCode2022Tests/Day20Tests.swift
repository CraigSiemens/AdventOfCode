import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day20Tests: XCTestCase {
    let day = Day20()
    
    let input: Input = """
    1
    2
    -3
    3
    -2
    0
    4
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 3)
//        XCTAssertEqual(day.part1Solution(), 4267)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 1623178306)
//        XCTAssertEqual(day.part2Solution(), 6871725358451)
    }
}
