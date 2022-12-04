import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day3Tests: XCTestCase {
    let day = Day3()
    
    let input: Input = """
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 157)
        XCTAssertEqual(day.part1Solution(), 7811)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 70)
        
        if #available(macOS 13, *) {
            // https://davedelong.com/blog/2022/12/03/adventures-in-advent-of-code/
            XCTAssertEqual(day.part2Solution(), 2639)
        }
    }
}
