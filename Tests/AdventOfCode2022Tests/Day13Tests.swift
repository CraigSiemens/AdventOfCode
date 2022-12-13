import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day13Tests: XCTestCase {
    let day = Day13()
    
    let input: Input = """
    [1,1,3,1,1]
    [1,1,5,1,1]
    
    [[1],[2,3,4]]
    [[1],4]
    
    [9]
    [[8,7,6]]
    
    [[4,4],4,4]
    [[4,4],4,4,4]
    
    [7,7,7,7]
    [7,7,7]
    
    []
    [3]
    
    [[[]]]
    [[]]
    
    [1,[2,[3,[4,[5,6,7]]]],8,9]
    [1,[2,[3,[4,[5,6,0]]]],8,9]
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 13)
        XCTAssertEqual(day.part1Solution(), 5760)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 140)
        XCTAssertEqual(day.part2Solution(), 26670)
    }
}
