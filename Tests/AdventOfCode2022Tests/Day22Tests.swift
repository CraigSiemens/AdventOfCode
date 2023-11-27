import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day22Tests: XCTestCase {
    let day = Day22()
    
    let input: Input = """
            ...#
            .#..
            #...
            ....
    ...#.......#
    ........#...
    ..#....#....
    ..........#.
            ...#....
            .....#..
            .#......
            ......#.
    
    10R5L5R10L4R5L5
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 6032)
        XCTAssertEqual(day.part1Solution(), 165094)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 5031)
        XCTAssertEqual(day.part2Solution(), 95316)
    }
}
