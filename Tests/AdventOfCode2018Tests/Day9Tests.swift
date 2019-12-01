import XCTest
@testable import AdventOfCode2018

final class Day9Tests: XCTestCase {
    let day = Day9()
        
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: "9 players; last marble is worth 25 points"), "32")
        XCTAssertEqual(day.part1Solution(for: "10 players; last marble is worth 1618 points"), "8317")
        XCTAssertEqual(day.part1Solution(for: "13 players; last marble is worth 7999 points"), "146373")
        XCTAssertEqual(day.part1Solution(for: "17 players; last marble is worth 1104 points"), "2764")
        XCTAssertEqual(day.part1Solution(for: "21 players; last marble is worth 6111 points"), "54718")
        XCTAssertEqual(day.part1Solution(for: "30 players; last marble is worth 5807 points"), "37305")
    }
    
    func testPart2() {
        // No example given, final answer takes ~8 sec
//        XCTAssertEqual(day.part2Solution(), "3412522480")
    }
}
