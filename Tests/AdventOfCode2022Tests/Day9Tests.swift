import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day9Tests: XCTestCase {
    let day = Day9()
    
    let input: Input = """
    R 4
    U 4
    L 3
    D 1
    R 4
    D 1
    L 5
    R 2
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 13)
        XCTAssertEqual(day.part1Solution(), 6087)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 1)
        XCTAssertEqual(day.part2Solution(), 2493)
    }
}
