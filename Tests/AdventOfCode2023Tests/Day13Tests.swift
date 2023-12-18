import Utilities
import XCTest
@testable import AdventOfCode2023

final class Day13Tests: XCTestCase {
    let day = Day13()
    
    let input: Input = """
    #.##..##.
    ..#.##.#.
    ##......#
    ##......#
    ..#.##.#.
    ..##..##.
    #.#.##.#.
    
    #...##..#
    #....#..#
    ..##..###
    #####.##.
    #####.##.
    ..##..###
    #....#..#
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 405)
        XCTAssertEqual(day.part1Solution(), 40006)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 400)
        XCTAssertEqual(day.part2Solution(), 28627)
    }
}
