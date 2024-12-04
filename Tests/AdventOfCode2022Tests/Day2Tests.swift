import Testing
import Utilities
@testable import AdventOfCode2022

struct Day2Tests {
    let day = Day2()
    
    let input: Input = """
    A Y
    B X
    C Z
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 15)
        #expect(day.part1Solution() == 12586)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 12)
        #expect(day.part2Solution() == 13193)
    }
}
