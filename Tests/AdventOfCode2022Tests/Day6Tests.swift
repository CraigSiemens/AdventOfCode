import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day6Tests: XCTestCase {
    let day = Day6()
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: "mjqjpqmgbljsphdztnvjfqwrcgsmlb"), 7)
        XCTAssertEqual(day.part1Solution(for: "bvwbjplbgvbhsrlpgdmjqwftvncz"), 5)
        XCTAssertEqual(day.part1Solution(for: "nppdvjthqldpwncqszvftbrmjlhg"), 6)
        XCTAssertEqual(day.part1Solution(for: "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"), 10)
        XCTAssertEqual(day.part1Solution(for: "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"), 11)
        
        XCTAssertEqual(day.part1Solution(), 1238)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: "mjqjpqmgbljsphdztnvjfqwrcgsmlb"), 19)
        XCTAssertEqual(day.part2Solution(for: "bvwbjplbgvbhsrlpgdmjqwftvncz"), 23)
        XCTAssertEqual(day.part2Solution(for: "nppdvjthqldpwncqszvftbrmjlhg"), 23)
        XCTAssertEqual(day.part2Solution(for: "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"), 29)
        XCTAssertEqual(day.part2Solution(for: "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"), 26)
        
        XCTAssertEqual(day.part2Solution(), 3037)
    }
}
