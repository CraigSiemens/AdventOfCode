import Testing
import Utilities
@testable import AdventOfCode2024

struct Day10Tests {
    let day = Day10()
    
    let input: Input = """
    89010123
    78121874
    87430965
    96549874
    45678903
    32019012
    01329801
    10456732
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 36)
        #expect(day.part1Solution() == 552)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 81)
        #expect(day.part2Solution() == 1225)
    }
}
