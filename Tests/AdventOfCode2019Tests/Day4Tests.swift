import XCTest
@testable import AdventOfCode2019

final class Day4Tests: XCTestCase {
    let day = Day4()
    
    func testPart1() {
        XCTAssertTrue(day.isValidPassword(111111, strict: false))
        XCTAssertFalse(day.isValidPassword(223450, strict: false))
        XCTAssertFalse(day.isValidPassword(123789, strict: false))
        
        XCTAssertEqual(day.part1Solution(for: "111110-111120"), "9")
    }
    
    func testPart2() {
        XCTAssertTrue(day.isValidPassword(112233, strict: true))
        XCTAssertFalse(day.isValidPassword(123444, strict: true))
        XCTAssertTrue(day.isValidPassword(111122, strict: true))

        XCTAssertEqual(day.part2Solution(for: "111110-111125"), "1")
    }
}
