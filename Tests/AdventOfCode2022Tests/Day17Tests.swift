import Testing
import Utilities
@testable import AdventOfCode2022

struct Day17Tests {
    let day = Day17()
    
    let input: Input = """
    >>><<><>><<<>><>>><<<>>><<<><<<>><>><<>>
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 3068)
        #expect(day.part1Solution() == 3106)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 1514285714288)
        #expect(day.part2Solution() == 1537175792495)
    }
}
