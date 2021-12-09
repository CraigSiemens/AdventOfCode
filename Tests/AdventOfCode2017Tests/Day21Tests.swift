import XCTest
@testable import AdventOfCode2017

final class Day21Tests: XCTestCase {
    let day = Day21()
    
    let input: Input = """
        ../.# => ##./#../...
        .#./..#/### => #..#/..../..../#..#
        """
    
    func testPart1() {
        XCTAssertEqual(Day21(iterations: 2).part1Solution(for: input), "12")

        XCTAssertEqual(day.part1Solution(), "162")
    }
    
    func testPart2() {
//        XCTAssertEqual(day.part2Solution(), "2264586")
    }
}
