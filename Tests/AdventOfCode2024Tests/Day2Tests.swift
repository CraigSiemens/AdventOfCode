import Utilities
import XCTest
@testable import AdventOfCode2024

final class Day2Tests: XCTestCase {
    let day = Day2()
    
    let input: Input = """
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 2)
        XCTAssertEqual(day.part1Solution(), 321)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 4)
        XCTAssertEqual(day.part2Solution(), 386)
    }
}
