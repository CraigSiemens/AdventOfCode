import XCTest
@testable import AdventOfCode2020

final class Day3Tests: XCTestCase {
    let day = Day3()
    
    let input = """
    ..##.......
    #...#...#..
    .#....#..#.
    ..#.#...#.#
    .#...##..#.
    ..#.##.....
    .#.#.#....#
    .#........#
    #.##...#...
    #...##....#
    .#..#...#.#
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "7")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "336")
    }
}
