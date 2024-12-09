import Testing
import Utilities
@testable import AdventOfCode2024

struct Day7Tests {
    let day = Day7()
    
    let input: Input = """
    190: 10 19
    3267: 81 40 27
    83: 17 5
    156: 15 6
    7290: 6 8 6 15
    161011: 16 10 13
    192: 17 8 14
    21037: 9 7 18 13
    292: 11 6 16 20
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 3749)
        #expect(day.part1Solution() == 1708857123053)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 11387)
        #expect(day.part2Solution() == 189207836795655)
    }
}
