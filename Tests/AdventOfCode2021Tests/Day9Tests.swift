import XCTest
@testable import AdventOfCode2021

final class Day9Tests: XCTestCase {
    let day = Day9()
    
    let input: Input = """
    2199943210
    3987894921
    9856789892
    8767896789
    9899965678
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "15")
        XCTAssertEqual(day.part1Solution(), "480")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "1134")
        XCTAssertEqual(day.part2Solution(), "1045660")
    }
}
