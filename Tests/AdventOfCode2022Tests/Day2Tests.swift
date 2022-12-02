import XCTest
@testable import AdventOfCode2022

final class Day2Tests: XCTestCase {
    let day = Day2()
    
    let input: Input = """
    A Y
    B X
    C Z
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "15")
        XCTAssertEqual(day.part1Solution(), "12586")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "12")
        XCTAssertEqual(day.part2Solution(), "13193")
    }
}
