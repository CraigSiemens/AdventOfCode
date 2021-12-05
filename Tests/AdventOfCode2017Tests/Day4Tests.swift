import XCTest
@testable import AdventOfCode2017

final class Day4Tests: XCTestCase {
    let day = Day4()
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: "aa bb cc dd ee"), "1")
        XCTAssertEqual(day.part1Solution(for: "aa bb cc dd aa"), "0")
        XCTAssertEqual(day.part1Solution(for: "aa bb cc dd aaa"), "1")

        XCTAssertEqual(day.part1Solution(), "386")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: "abcde fghij"), "1")
        XCTAssertEqual(day.part2Solution(for: "abcde xyz ecdab"), "0")
        XCTAssertEqual(day.part2Solution(for: "a ab abc abd abf abj"), "1")
        XCTAssertEqual(day.part2Solution(for: "iiii oiii ooii oooi oooo"), "1")
        XCTAssertEqual(day.part2Solution(for: "oiii ioii iioi iiio"), "0")

        XCTAssertEqual(day.part2Solution(), "208")
    }
}
