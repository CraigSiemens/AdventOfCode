import XCTest
@testable import AdventOfCode2017

final class Day24Tests: XCTestCase {
    let day = Day24()
    
    let input = """
        0/2
        2/2
        2/3
        3/4
        3/5
        0/1
        10/1
        9/10
        """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "31")

//        XCTAssertEqual(day.part1Solution(), "1859")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "19")

//        XCTAssertEqual(day.part2Solution(), "1799")
    }
}
