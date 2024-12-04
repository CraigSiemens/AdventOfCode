import Testing
import Utilities
@testable import AdventOfCode2022

struct Day14Tests {
    let day = Day14()
    
    let input: Input = """
    498,4 -> 498,6 -> 496,6
    503,4 -> 502,4 -> 502,9 -> 494,9
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 24)
        #expect(day.part1Solution() == 737)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 93)
        #expect(day.part2Solution() == 28145)
    }
}
