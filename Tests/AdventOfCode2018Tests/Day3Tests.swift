import XCTest
@testable import Day3

final class Day3Tests: XCTestCase {
    let day = Day3()
    let input = """
        #1 @ 1,3: 4x4
        #2 @ 3,1: 4x4
        #3 @ 5,5: 2x2
        """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "4")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "3")
    }
}
