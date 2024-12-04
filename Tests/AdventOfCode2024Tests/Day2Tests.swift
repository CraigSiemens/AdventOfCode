import Testing
import Utilities
@testable import AdventOfCode2024

struct Day2Tests {
    let day = Day2()
    
    let input: Input = """
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 2)
        #expect(day.part1Solution() == 321)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 4)
        #expect(day.part2Solution() == 386)
    }
}
