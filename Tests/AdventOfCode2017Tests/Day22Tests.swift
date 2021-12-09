import XCTest
@testable import AdventOfCode2017

final class Day22Tests: XCTestCase {
    let day = Day22()
    
    let input: Input = """
        ..#
        #..
        ...
        """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "5587")

        XCTAssertEqual(day.part1Solution(), "5447")
    }
    
    func testPart2() {
//        XCTAssertEqual(day.part2Solution(for: input), "2511944")

//        XCTAssertEqual(day.part2Solution(), "2511705")
    }
}
