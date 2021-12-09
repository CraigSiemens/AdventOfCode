import XCTest
@testable import AdventOfCode2021

final class Day7Tests: XCTestCase {
    let day = Day7()
    
    let input: Input = """
    16,1,2,0,4,2,7,1,2,14
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "37")
        XCTAssertEqual(day.part1Solution(), "354129")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "168")
        XCTAssertEqual(day.part2Solution(), "98905973")
    }
}
