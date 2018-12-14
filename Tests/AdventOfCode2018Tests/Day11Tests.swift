import XCTest
@testable import Day11

final class Day11Tests: XCTestCase {
    let day = Day11()
    
    func testPart1() {
        XCTAssertEqual(day.value(for: 8, x: 3, y: 5), 4)
        XCTAssertEqual(day.value(for: 57, x: 121, y: 78), -5)
        XCTAssertEqual(day.value(for: 39, x: 217, y: 196), 0)
        XCTAssertEqual(day.value(for: 71, x: 101, y: 153), 4)
        
        XCTAssertEqual(day.part1Solution(for: "18"), "33,45")
        XCTAssertEqual(day.part1Solution(for: "42"), "21,61")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: "18"), "90,269,16")
//        XCTAssertEqual(day.part2Solution(for: "42"), "232,251,12")
    }
}
