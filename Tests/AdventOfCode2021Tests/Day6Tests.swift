import XCTest
@testable import AdventOfCode2021

final class Day6Tests: XCTestCase {
    let day = Day6()
    
    let input = """
    3,4,3,1,2
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "5934")
        XCTAssertEqual(day.part1Solution(), "359344")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "26984457539")
        XCTAssertEqual(day.part2Solution(), "1629570219571")
    }
}
