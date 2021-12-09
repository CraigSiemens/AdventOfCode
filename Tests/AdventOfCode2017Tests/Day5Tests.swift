import XCTest
@testable import AdventOfCode2017

final class Day5Tests: XCTestCase {
    let day = Day5()
    
    let input: Input = """
        0
        3
        0
        1
        -3
        """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "5")

        XCTAssertEqual(day.part1Solution(), "356945")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "10")

        XCTAssertEqual(day.part2Solution(), "28372145")
    }
}
