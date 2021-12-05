import XCTest
@testable import AdventOfCode2017

final class Day17Tests: XCTestCase {
    let day = Day17()
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: "3"), "638")

        XCTAssertEqual(day.part1Solution(), "725")
    }
    
    func testPart2() {
        // Slow
//        XCTAssertEqual(day.part2Solution(), "27361412")
    }
}
