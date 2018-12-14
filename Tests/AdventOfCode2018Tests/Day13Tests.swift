import XCTest
@testable import Day13
@testable import Utilities

final class Day13Tests: XCTestCase {
    let day = Day13()
    
    
    func testPart1() {
        let input = """
        /->-\\
        |   |  /----\\
        | /-+--+-\\  |
        | | |  | v  |
        \\-+-/  \\-+--/
          \\------/
        """
        
        XCTAssertEqual(day.part1Solution(for: input), "7,3")
        XCTAssertEqual(day.part1Solution(for: "->---<-"), "3,0")
        XCTAssertEqual(day.part1Solution(for: "->--<-"), "3,0")
    }
    
    func testPart2() {
        let input = """
        />-<\\
        |   |
        | /<+-\\
        | | | v
        \\>+</ |
          |   ^
          \\<->/
        """
        
        XCTAssertEqual(day.part2Solution(for: input), "6,4")
    }
}
