import Testing
import Utilities
@testable import AdventOfCode2024

struct Day11Tests {
    let day = Day11()
    
    let input: Input = """
    125 17
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 55312)
        #expect(day.part1Solution() == 239714)
    }
    
    @Test func part2() {
        #expect(day.part2Solution() == 284973560658514)
    }
}
