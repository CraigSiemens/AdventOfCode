import Testing
import Utilities
@testable import AdventOfCode2023

struct Day8Tests {
    let day = Day8()
    
    @Test func part1() {
        let input: Input = """
        LLR
        
        AAA = (BBB, BBB)
        BBB = (AAA, ZZZ)
        ZZZ = (ZZZ, ZZZ)
        """
            
        #expect(day.part1Solution(for: input) == 6)
        #expect(day.part1Solution() == 21251)
    }
    
    @Test func part2() {
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
        
        #expect(day.part2Solution(for: input) == 6)
        #expect(day.part2Solution() == 11678319315857)
    }
}
