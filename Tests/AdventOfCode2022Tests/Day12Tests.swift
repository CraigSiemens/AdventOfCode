import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day12Tests: XCTestCase {
    let day = Day12()
    
    let input: Input = """
    Sabqponm
    abcryxxl
    accszExk
    acctuvwj
    abdefghi
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 31)
        XCTAssertEqual(day.part1Solution(), 481)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 29)
        XCTAssertEqual(day.part2Solution(), 480)
    }
}
