import Utilities
import XCTest
@testable import AdventOfCode2023

final class Day1Tests: XCTestCase {
    let day = Day1()
    
    func testPart1() {
        let input: Input = """
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
        """
        
        XCTAssertEqual(day.part1Solution(for: input), 142)
        XCTAssertEqual(day.part1Solution(), 53386)
    }
    
    func testPart2() {
        let input: Input = """
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen
        """
        
        XCTAssertEqual(day.part2Solution(for: input), 281)
        XCTAssertEqual(day.part2Solution(), 53312)
    }
}
