import Utilities
import XCTest
@testable import AdventOfCode2023

final class Day6Tests: XCTestCase {
    let day = Day6()
    
    let input: Input = """
    Time:      7  15   30
    Distance:  9  40  200
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 288)
        XCTAssertEqual(day.part1Solution(), 252000)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 71503)
        XCTAssertEqual(day.part2Solution(), 36992486)
    }
}
