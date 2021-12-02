import XCTest
@testable import AdventOfCode2017

final class Day9Tests: XCTestCase {
    let day = Day9()
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: "{}"), "1")
        XCTAssertEqual(day.part1Solution(for: "{{{}}}"), "6")
        XCTAssertEqual(day.part1Solution(for: "{{},{}}"), "5")
        XCTAssertEqual(day.part1Solution(for: "{{{},{},{{}}}}"), "16")
        XCTAssertEqual(day.part1Solution(for: "{<a>,<a>,<a>,<a>}"), "1")
        XCTAssertEqual(day.part1Solution(for: "{{<ab>},{<ab>},{<ab>},{<ab>}}"), "9")
        XCTAssertEqual(day.part1Solution(for: "{{<!!>},{<!!>},{<!!>},{<!!>}}"), "9")
        XCTAssertEqual(day.part1Solution(for: "{{<a!>},{<a!>},{<a!>},{<ab>}}"), "3")

        XCTAssertEqual(day.part1Solution(), "23588")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: "{<>}"), "0")
        XCTAssertEqual(day.part2Solution(for: "{<random characters>}"), "17")
        XCTAssertEqual(day.part2Solution(for: "{<<<<>}"), "3")
        XCTAssertEqual(day.part2Solution(for: "{<{!>}>}"), "2")
        XCTAssertEqual(day.part2Solution(for: "{<!!>}"), "0")
        XCTAssertEqual(day.part2Solution(for: "{<!!!>>}"), "0")
        XCTAssertEqual(day.part2Solution(for: "{<{o\"i!a,<{i<a>}"), "10")

        XCTAssertEqual(day.part2Solution(), "10045")
    }
}
