import XCTest
@testable import AdventOfCode2018

final class Day12Tests: XCTestCase {
    let day = Day12()
    
    let input = """
    initial state: #..#.#..##......###...###

    ...## => #
    ..#.. => #
    .#... => #
    .#.#. => #
    .#.## => #
    .##.. => #
    .#### => #
    #.#.# => #
    #.### => #
    ##.#. => #
    ##.## => #
    ###.. => #
    ###.# => #
    ####. => #
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "325")
        XCTAssertEqual(day.part1Solution(), "3472")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(), "2600000000919")
    }
}
