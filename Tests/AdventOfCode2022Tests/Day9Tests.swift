import Testing
import Utilities
@testable import AdventOfCode2022

struct Day9Tests {
    let day = Day9()
    
    let input: Input = """
    R 4
    U 4
    L 3
    D 1
    R 4
    D 1
    L 5
    R 2
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 13)
        #expect(day.part1Solution() == 6087)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 1)
        #expect(day.part2Solution() == 2493)
    }
}
