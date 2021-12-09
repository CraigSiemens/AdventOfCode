import XCTest
@testable import AdventOfCode2017

final class Day13Tests: XCTestCase {
    let day = Day13()
    
    let input: Input = """
        0: 3
        1: 2
        4: 4
        6: 4
        """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "24")

        XCTAssertEqual(day.part1Solution(), "2160")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "10")

        // Slow
//        XCTAssertEqual(day.part2Solution(), "3907470")
    }
}
