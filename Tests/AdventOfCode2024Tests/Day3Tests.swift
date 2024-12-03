import Utilities
import XCTest
@testable import AdventOfCode2024

final class Day3Tests: XCTestCase {
    let day = Day3()
    
    func testPart1() {
        let input: Input = """
        xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
        """
        XCTAssertEqual(day.part1Solution(for: input), 161)
        XCTAssertEqual(day.part1Solution(), 183788984)
    }
    
    func testPart2() {
        let input: Input = """
        xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
        """
        XCTAssertEqual(day.part2Solution(for: input), 48)
        XCTAssertEqual(day.part2Solution(), 62098619)
    }
}
