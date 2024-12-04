import Testing
import Utilities
@testable import AdventOfCode2022

struct Day20Tests {
    let day = Day20()
    
    let input: Input = """
    1
    2
    -3
    3
    -2
    0
    4
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 3)
//        #expect(day.part1Solution() == 4267)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 1623178306)
//        #expect(day.part2Solution() == 6871725358451)
    }
}
