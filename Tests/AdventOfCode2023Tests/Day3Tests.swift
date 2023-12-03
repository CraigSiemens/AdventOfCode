import Utilities
import XCTest
@testable import AdventOfCode2023

final class Day3Tests: XCTestCase {
    let day = Day3()
    
    let input: Input = """
    467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 4361)
        XCTAssertEqual(day.part1Solution(), 532428)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 467835)
        XCTAssertEqual(day.part2Solution(), 84051670)
    }
}
