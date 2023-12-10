import Utilities
import XCTest
@testable import AdventOfCode2023

final class Day9Tests: XCTestCase {
    let day = Day9()
    
    let input: Input = """
    0 3 6 9 12 15
    1 3 6 10 15 21
    10 13 16 21 30 45
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 114)
        XCTAssertEqual(day.part1Solution(), 1934898178)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 2)
        XCTAssertEqual(day.part2Solution(), 1129)
    }
}
