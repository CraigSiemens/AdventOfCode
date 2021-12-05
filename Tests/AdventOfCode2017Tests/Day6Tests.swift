import XCTest
@testable import AdventOfCode2017

final class Day6Tests: XCTestCase {
    let day = Day6()
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: "0 2 7 0"), "5")

        XCTAssertEqual(day.part1Solution(), "7864")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: "0 2 7 0"), "4")

        XCTAssertEqual(day.part2Solution(), "1695")
    }
}
