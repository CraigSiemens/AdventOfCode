import XCTest
@testable import AdventOfCode2021

final class Day2Tests: XCTestCase {
    let day = Day2()
    
    let input = """
    forward 5
    down 5
    forward 8
    up 3
    down 8
    forward 2
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "150")
        XCTAssertEqual(day.part1Solution(), "1499229")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "900")
        XCTAssertEqual(day.part2Solution(), "1340836560")
    }
}
