import XCTest
@testable import AdventOfCode2017

final class Day11Tests: XCTestCase {
    let day = Day11()
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: "ne,ne,ne"), "3")
        XCTAssertEqual(day.part1Solution(for: "ne,ne,sw,sw"), "0")
        XCTAssertEqual(day.part1Solution(for: "ne,ne,s,s"), "2")
        XCTAssertEqual(day.part1Solution(for: "se,sw,se,sw,sw"), "3")


        XCTAssertEqual(day.part1Solution(), "747")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: "ne,ne,ne"), "3")
        XCTAssertEqual(day.part2Solution(for: "ne,ne,sw,sw"), "2")
        XCTAssertEqual(day.part2Solution(for: "ne,ne,s,s"), "2")
        XCTAssertEqual(day.part2Solution(for: "se,sw,se,sw,sw"), "3")

        XCTAssertEqual(day.part2Solution(), "1544")
    }
}
