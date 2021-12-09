import XCTest
@testable import AdventOfCode2020

final class Day2Tests: XCTestCase {
    let day = Day2()
    
    let input: Input = """
    1-3 a: abcde
    1-3 b: cdefg
    2-9 c: ccccccccc
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "2")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "1")
    }
}
