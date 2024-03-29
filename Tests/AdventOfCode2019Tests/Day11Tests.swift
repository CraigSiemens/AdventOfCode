import XCTest
@testable import AdventOfCode2019

final class Day11Tests: XCTestCase {
    let day = Day11()
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(), "1747")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(), "ZCGRHKLB")
    }
}
