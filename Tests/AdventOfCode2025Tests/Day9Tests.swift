import Testing
import Utilities
@testable import AdventOfCode2025

struct Day9Tests {
    let day = Day9()
    
    let input: Input = """
    7,1
    11,1
    11,7
    9,7
    9,5
    2,5
    2,3
    7,3
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 50)
        #expect(day.part1Solution() == 4764078684)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 24)
        #expect(day.part2Solution() == 1652344888)
    }
}
