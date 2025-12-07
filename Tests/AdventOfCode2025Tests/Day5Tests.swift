import Testing
import Utilities
@testable import AdventOfCode2025

struct Day5Tests {
    let day = Day5()
    
    let input: Input = """
    3-5
    10-14
    16-20
    12-18
    
    1
    5
    8
    11
    17
    32
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 3)
        #expect(day.part1Solution() == 635)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 14)
        #expect(day.part2Solution() == 369761800782619)
    }
}
