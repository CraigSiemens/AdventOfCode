import Utilities
import XCTest
@testable import AdventOfCode2023

final class Day11Tests: XCTestCase {
    let day = Day11()
    
    let input: Input = """
    ...#......
    .......#..
    #.........
    ..........
    ......#...
    .#........
    .........#
    ..........
    .......#..
    #...#.....
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 374)
        XCTAssertEqual(day.part1Solution(), 9639160)
    }
    
    func testPart2() {
        XCTAssertEqual(day.solution(for: input, expansion: 10), 1030)
        XCTAssertEqual(day.solution(for: input, expansion: 100), 8410)
        XCTAssertEqual(day.part2Solution(), 752936133304)
    }
}
