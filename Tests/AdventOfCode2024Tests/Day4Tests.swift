import Utilities
import XCTest
@testable import AdventOfCode2024

final class Day4Tests: XCTestCase {
    let day = Day4()
    
    let input: Input = """
    MMMSXXMASM
    MSAMXMSMSA
    AMXSXMAAMM
    MSAMASMSMX
    XMASAMXAMM
    XXAMMXXAMA
    SMSMSASXSS
    SAXAMASAAA
    MAMMMXMMMM
    MXMXAXMASX
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 18)
        XCTAssertEqual(day.part1Solution(), 2554)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 9)
        XCTAssertEqual(day.part2Solution(), 1916)
    }
}
