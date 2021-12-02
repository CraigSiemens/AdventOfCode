import XCTest
@testable import AdventOfCode2017

final class Day12Tests: XCTestCase {
    let day = Day12()
    
    let input = """
        0 <-> 2
        1 <-> 1
        2 <-> 0, 3, 4
        3 <-> 2, 4
        4 <-> 2, 3, 6
        5 <-> 6
        6 <-> 4, 5
        """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "6")

        XCTAssertEqual(day.part1Solution(), "306")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "2")

        XCTAssertEqual(day.part2Solution(), "200")
    }
}
