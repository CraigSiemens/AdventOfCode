import XCTest
@testable import AdventOfCode2021

final class Day11Tests: XCTestCase {
    let day = Day11()
    
    let input: Input = """
    5483143223
    2745854711
    5264556173
    6141336146
    6357385478
    4167524645
    2176841721
    6882881134
    4846848554
    5283751526
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "1656")
        XCTAssertEqual(day.part1Solution(), "1785")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "195")
        XCTAssertEqual(day.part2Solution(), "354")
    }
}
