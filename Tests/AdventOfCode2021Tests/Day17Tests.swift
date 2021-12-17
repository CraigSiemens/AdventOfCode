import XCTest
@testable import AdventOfCode2021

final class Day17Tests: XCTestCase {
    let day = Day17()
    
    let input: Input = """
    target area: x=20..30, y=-10..-5
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "45")
        XCTAssertEqual(day.part1Solution(), "9730")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "112")
        XCTAssertEqual(day.part2Solution(), "4110")
    }
}
