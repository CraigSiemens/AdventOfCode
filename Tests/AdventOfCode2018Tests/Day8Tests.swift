import XCTest
@testable import AdventOfCode2018

final class Day8Tests: XCTestCase {
    let day = Day8()
    
    let input: Input = """
    2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "138")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "66")
    }
}
