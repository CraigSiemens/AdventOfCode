import XCTest
@testable import AdventOfCode2017

final class Day8Tests: XCTestCase {
    let day = Day8()
    
    let input = """
        b inc 5 if a > 1
        a inc 1 if b < 5
        c dec -10 if a >= 1
        c inc -20 if c == 10
        """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "1")
        
        XCTAssertEqual(day.part1Solution(), "4066")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "10")
        
        XCTAssertEqual(day.part2Solution(), "4829")
    }
}
