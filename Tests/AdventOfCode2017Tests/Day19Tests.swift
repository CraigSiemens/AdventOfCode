import XCTest
@testable import AdventOfCode2017

final class Day19Tests: XCTestCase {
    let day = Day19()
    
    let input = """
             |
             |  +--+
             A  |  C
         F---|----E|--+
             |  |  |  D
             +B-+  +--+

        """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "ABCDEF")

        XCTAssertEqual(day.part1Solution(), "GEPYAWTMLK")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "38")

        XCTAssertEqual(day.part2Solution(), "17628")
    }
}
