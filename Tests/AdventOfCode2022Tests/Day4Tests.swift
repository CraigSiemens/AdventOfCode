import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day4Tests: XCTestCase {
    let day = Day4()
    
    let input: Input = """
    2-4,6-8
    2-3,4-5
    5-7,7-9
    2-8,3-7
    6-6,4-6
    2-6,4-8
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 2)
        XCTAssertEqual(day.part1Solution(), 515)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 4)
        XCTAssertEqual(day.part2Solution(), 883)
    }
}
