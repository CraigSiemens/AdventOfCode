import XCTest
@testable import AdventOfCode2018

final class Day1Tests: XCTestCase {
    let day = Day1()
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: "+1, -2, +3, +1"), "3")
        XCTAssertEqual(day.part1Solution(for: "+1, +1, +1"), "3")
        XCTAssertEqual(day.part1Solution(for: "+1, +1, -2"), "0")
        XCTAssertEqual(day.part1Solution(for: "-1, -2, -3"), "-6")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: "+1, -2, +3, +1"), "2")
        XCTAssertEqual(day.part2Solution(for: "+1, -1"), "0")
        XCTAssertEqual(day.part2Solution(for: "+3, +3, +4, -2, -4"), "10")
        XCTAssertEqual(day.part2Solution(for: "-6, +3, +8, +5, -6"), "5")
        XCTAssertEqual(day.part2Solution(for: "+7, +7, -2, -7, -4"), "14")
    }
}
