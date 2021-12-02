import XCTest
@testable import AdventOfCode2017

final class Day25Tests: XCTestCase {
    let day = Day25()
    
    let input = """
        Begin in state A.
        Perform a diagnostic checksum after 6 steps.

        In state A:
          If the current value is 0:
            - Write the value 1.
            - Move one slot to the right.
            - Continue with state B.
          If the current value is 1:
            - Write the value 0.
            - Move one slot to the left.
            - Continue with state B.

        In state B:
          If the current value is 0:
            - Write the value 1.
            - Move one slot to the left.
            - Continue with state A.
          If the current value is 1:
            - Write the value 1.
            - Move one slot to the right.
            - Continue with state A.
        """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "3")

//        XCTAssertEqual(day.part1Solution(), "2832")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(), "freebee")
    }
}
