import XCTest
@testable import AdventOfCode2021

final class Day3Tests: XCTestCase {
    let day = Day3()
    
    let input: Input = """
    00100
    11110
    10110
    10111
    10101
    01111
    00111
    11100
    10000
    11001
    00010
    01010
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "198")
        XCTAssertEqual(day.part1Solution(), "1307354")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "230")
        XCTAssertEqual(day.part2Solution(), "482500")
    }
}
