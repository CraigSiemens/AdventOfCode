import XCTest
@testable import AdventOfCode2020

final class Day5Tests: XCTestCase {
    let day = Day5()
    
    func testSeatID() {
        XCTAssertEqual(day.seatID(for: "FBFBBFFRLR"), 357)
        XCTAssertEqual(day.seatID(for: "BFFFBBFRRR"), 567)
        XCTAssertEqual(day.seatID(for: "FFFBBBFRRR"), 119)
        XCTAssertEqual(day.seatID(for: "BBFFBBFRLL"), 820)
    }
    
    func testPart1() {
        let input: Input = """
        FBFBBFFRLR
        BFFFBBFRRR
        FFFBBBFRRR
        BBFFBBFRLL
        """
        
        XCTAssertEqual(day.part1Solution(for: input), "820")
    }
    
    func testPart2() {
        let input: Input = """
        FFFFFFFLLL
        FFFFFFFLLR
        FFFFFFFLRL
        FFFFFFFRLL
        """
        
        XCTAssertEqual(day.part2Solution(for: input), "3")
    }
}
