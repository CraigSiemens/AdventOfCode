import Testing
import Utilities
@testable import AdventOfCode2023

struct Day9Tests {
    let day = Day9()
    
    let input: Input = """
    0 3 6 9 12 15
    1 3 6 10 15 21
    10 13 16 21 30 45
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 114)
        #expect(day.part1Solution() == 1934898178)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 2)
        #expect(day.part2Solution() == 1129)
    }
}
