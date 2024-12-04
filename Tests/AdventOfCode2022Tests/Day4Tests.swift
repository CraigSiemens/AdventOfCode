import Testing
import Utilities
@testable import AdventOfCode2022

struct Day4Tests {
    let day = Day4()
    
    let input: Input = """
    2-4,6-8
    2-3,4-5
    5-7,7-9
    2-8,3-7
    6-6,4-6
    2-6,4-8
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 2)
        #expect(day.part1Solution() == 515)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 4)
        #expect(day.part2Solution() == 883)
    }
}
