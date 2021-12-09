import XCTest
@testable import AdventOfCode2017

final class Day2Tests: XCTestCase {
    let day = Day2()
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: "5 1 9 5"), "8")
        XCTAssertEqual(day.part1Solution(for: "7 5 3"), "4")
        XCTAssertEqual(day.part1Solution(for: "2 4 6 8"), "6")

        let input: Input = """
        5 1 9 5
        7 5 3
        2 4 6 8
        """
        XCTAssertEqual(day.part1Solution(for: input), "18")
        
        XCTAssertEqual(day.part1Solution(), "58975")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: "5 9 2 8"), "4")
        XCTAssertEqual(day.part2Solution(for: "9 4 7 3"), "3")
        XCTAssertEqual(day.part2Solution(for: "3 8 6 5"), "2")

        let input: Input = """
        5 9 2 8
        9 4 7 3
        3 8 6 5
        """
        XCTAssertEqual(day.part2Solution(for: input), "9")
        
        XCTAssertEqual(day.part2Solution(), "308")

    }
}
