import Testing
import Utilities
@testable import AdventOfCode2023

struct Day6Tests {
    let day = Day6()
    
    let input: Input = """
    Time:      7  15   30
    Distance:  9  40  200
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 288)
        #expect(day.part1Solution() == 252000)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 71503)
        #expect(day.part2Solution() == 36992486)
    }
}
