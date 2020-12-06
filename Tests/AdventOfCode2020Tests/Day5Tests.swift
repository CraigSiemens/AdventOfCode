import XCTest
@testable import AdventOfCode2020

final class Day5Tests: XCTestCase {
    let day = Day5()
    
    let input = """
    FBFBBFFRLR
    BFFFBBFRRR
    FFFBBBFRRR
    BBFFBBFRLL
    """
    
    func testSeatID() {
        XCTAssertEqual(day.seatID(for: "FBFBBFFRLR"), 357)
        XCTAssertEqual(day.seatID(for: "BFFFBBFRRR"), 567)
        XCTAssertEqual(day.seatID(for: "FFFBBBFRRR"), 119)
        XCTAssertEqual(day.seatID(for: "BBFFBBFRLL"), 820)
    }
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "820")
    }
    
    func testPart2() {
//        XCTAssertEqual(day.part2Solution(for: input), "<#output#>")
//        XCTAssertEqual(day.part1Solution(for: "<#input#>"), "<#output#>")
    }
}
