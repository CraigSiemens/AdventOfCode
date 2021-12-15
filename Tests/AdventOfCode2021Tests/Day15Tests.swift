import XCTest
@testable import AdventOfCode2021

final class Day15Tests: XCTestCase {
    let day = Day15()
    
    let input: Input = """
    1163751742
    1381373672
    2136511328
    3694931569
    7463417111
    1319128137
    1359912421
    3125421639
    1293138521
    2311944581
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "40")
        XCTAssertEqual(day.part1Solution(), "393")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "315")
//        XCTAssertEqual(day.part2Solution(), "2823") // Slow 76.203 secs
    }
}
