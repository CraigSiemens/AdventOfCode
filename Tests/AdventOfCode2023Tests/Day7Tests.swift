import Utilities
import XCTest
@testable import AdventOfCode2023

final class Day7Tests: XCTestCase {
    let day = Day7()
    
    let input: Input = """
    32T3K 765
    T55J5 684
    KK677 28
    KTJJT 220
    QQQJA 483
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 6440)
        XCTAssertEqual(day.part1Solution(), 248113761)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 5905)
        XCTAssertEqual(day.part2Solution(), 246285222)
    }
}
