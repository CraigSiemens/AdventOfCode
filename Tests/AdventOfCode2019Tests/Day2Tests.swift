import XCTest
@testable import AdventOfCode2019

final class Day2Tests: XCTestCase {
    let day = Day2()
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(), "3760627")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(), "7195")
    }
}
