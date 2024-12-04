import Testing
import Utilities
@testable import AdventOfCode2024

struct Day1Tests {
    let day = Day1()
    
    let input: Input = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 11)
        #expect(day.part1Solution() == 1341714)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 31)
        #expect(day.part2Solution() == 27384707)
    }
}
