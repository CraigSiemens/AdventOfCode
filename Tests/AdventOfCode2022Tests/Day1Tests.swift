import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day1Tests: XCTestCase {
    let day = Day1()
    
    let input: Input = """
    1000
    2000
    3000

    4000

    5000
    6000

    7000
    8000
    9000

    10000
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "24000")
        XCTAssertEqual(day.part1Solution(), "71023")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "45000")
        XCTAssertEqual(day.part2Solution(), "206289")
    }
}
