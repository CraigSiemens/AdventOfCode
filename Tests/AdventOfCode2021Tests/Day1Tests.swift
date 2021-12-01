import XCTest
@testable import AdventOfCode2021

final class Day1Tests: XCTestCase {
    let day = Day1()
    
    let input = """
    199
    200
    208
    210
    200
    207
    240
    269
    260
    263
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "7")
        XCTAssertEqual(day.part1Solution(), "1162")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "5")
        XCTAssertEqual(day.part2Solution(), "1190")
    }
}
