import Utilities
import XCTest
@testable import AdventOfCode2024

final class Day1Tests: XCTestCase {
    let day = Day1()
    
    let input: Input = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 11)
        XCTAssertEqual(day.part1Solution(), 1341714)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 31)
        XCTAssertEqual(day.part2Solution(), 27384707)
    }
}
