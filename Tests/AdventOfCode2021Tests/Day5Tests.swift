import XCTest
@testable import AdventOfCode2021

final class Day5Tests: XCTestCase {
    let day = Day5()
    
    let input: Input = """
    0,9 -> 5,9
    8,0 -> 0,8
    9,4 -> 3,4
    2,2 -> 2,1
    7,0 -> 7,4
    6,4 -> 2,0
    0,9 -> 2,9
    3,4 -> 1,4
    0,0 -> 8,8
    5,5 -> 8,2
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "5")
        XCTAssertEqual(day.part1Solution(), "5124")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "12")
        XCTAssertEqual(day.part2Solution(), "19771")
    }
}
