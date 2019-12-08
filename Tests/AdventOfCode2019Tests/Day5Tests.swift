import XCTest
@testable import AdventOfCode2019

final class Day5Tests: XCTestCase {
    let day = Day5()
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(), "16434972")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(), "16694270")
    }
}
