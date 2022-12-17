import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day14Tests: XCTestCase {
    let day = Day14()
    
    let input: Input = """
    498,4 -> 498,6 -> 496,6
    503,4 -> 502,4 -> 502,9 -> 494,9
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 24)
        XCTAssertEqual(day.part1Solution(), 737)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 93)
        XCTAssertEqual(day.part2Solution(), 28145)
    }
}
