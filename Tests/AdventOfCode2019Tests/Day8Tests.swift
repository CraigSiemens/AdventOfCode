import XCTest
@testable import AdventOfCode2019

final class Day8Tests: XCTestCase {
    let day = Day8()
        
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: "123456789089", width: 3, height: 2), "1")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: "0222112222120000", width: 2, height: 2), " █\n█ ")
    }
}
