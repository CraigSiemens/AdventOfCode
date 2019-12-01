import XCTest
@testable import AdventOfCode2018

final class Day6Tests: XCTestCase {
    let day = Day6()
    
    let input = """
    1, 1
    1, 6
    8, 3
    3, 4
    5, 5
    8, 9
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "17")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input, minDistance: 32), "16")
    }
}
