import Testing
import Utilities
@testable import AdventOfCode2024

struct Day9Tests {
    let day = Day9()
    
    let input: Input = """
    2333133121414131402
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 1928)
        #expect(day.part1Solution() == 6320029754031)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 2858)
        //#expect(day.part2Solution() == 6347435485773)
    }
}
