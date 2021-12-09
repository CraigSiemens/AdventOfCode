import XCTest
@testable import AdventOfCode2020

final class Day1Tests: XCTestCase {
    let day = Day1()
    
    let input: Input = """
    1721
    979
    366
    299
    675
    1456
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "514579")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "241861950")
    }
}
