import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day17Tests: XCTestCase {
    let day = Day17()
    
    let input: Input = """
    >>><<><>><<<>><>>><<<>>><<<><<<>><>><<>>
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 3068)
        XCTAssertEqual(day.part1Solution(), 3106)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 1514285714288)
        XCTAssertEqual(day.part2Solution(), 1537175792495)
    }
}
