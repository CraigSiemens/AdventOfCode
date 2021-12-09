import XCTest
@testable import AdventOfCode2020

final class Day6Tests: XCTestCase {
    let day = Day6()
    
    let input: Input = """
    abc

    a
    b
    c

    ab
    ac

    a
    a
    a
    a

    b
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "11")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "6")
    }
}
