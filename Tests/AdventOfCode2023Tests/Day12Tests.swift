import Utilities
import XCTest
@testable import AdventOfCode2023

final class Day12Tests: XCTestCase {
    let day = Day12()
    
    let input: Input = """
    ???.### 1,1,3
    .??..??...?##. 1,1,3
    ?#?#?#?#?#?#?#? 1,3,1,6
    ????.#...#... 4,1,1
    ????.######..#####. 1,6,5
    ?###???????? 3,2,1
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 21)
        XCTAssertEqual(day.part1Solution(), 7857)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 525152)
        XCTAssertEqual(day.part2Solution(), 28606137449920)
    }
}
