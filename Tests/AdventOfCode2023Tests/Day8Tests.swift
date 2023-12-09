import Utilities
import XCTest
@testable import AdventOfCode2023

final class Day8Tests: XCTestCase {
    let day = Day8()
    
    func testPart1() {
        let input: Input = """
        LLR
        
        AAA = (BBB, BBB)
        BBB = (AAA, ZZZ)
        ZZZ = (ZZZ, ZZZ)
        """
            
        XCTAssertEqual(day.part1Solution(for: input), 6)
        XCTAssertEqual(day.part1Solution(), 21251)
    }
    
    func testPart2() {
        let input: Input = """
        LR
        
        11A = (11B, XXX)
        11B = (XXX, 11Z)
        11Z = (11B, XXX)
        22A = (22B, XXX)
        22B = (22C, 22C)
        22C = (22Z, 22Z)
        22Z = (22B, 22B)
        XXX = (XXX, XXX)
        """
        
        XCTAssertEqual(day.part2Solution(for: input), 6)
        XCTAssertEqual(day.part2Solution(), 11678319315857)
    }
}
