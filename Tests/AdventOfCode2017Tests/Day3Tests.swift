import XCTest
@testable import AdventOfCode2017

final class Day3Tests: XCTestCase {
    let day = Day3()
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: "1"), "0")
        XCTAssertEqual(day.part1Solution(for: "12"), "3")
        XCTAssertEqual(day.part1Solution(for: "23"), "2")
        XCTAssertEqual(day.part1Solution(for: "1024"), "31")
        
        XCTAssertEqual(day.part1Solution(), "480")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: "800"), "806")
        
        XCTAssertEqual(day.part2Solution(), "349975")
    }
}
