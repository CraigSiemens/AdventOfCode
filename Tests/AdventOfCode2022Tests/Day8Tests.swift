import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day8Tests: XCTestCase {
    let day = Day8()
    
    let input: Input = """
    30373
    25512
    65332
    33549
    35390
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 21)
        XCTAssertEqual(day.part1Solution(), 1672)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 8)
        XCTAssertEqual(day.part2Solution(), 327180)
    }
}
