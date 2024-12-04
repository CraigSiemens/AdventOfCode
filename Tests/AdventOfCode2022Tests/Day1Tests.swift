import Testing
import Utilities
@testable import AdventOfCode2022

struct Day1Tests {
    let day = Day1()
    
    let input: Input = """
    1000
    2000
    3000

    4000

    5000
    6000

    7000
    8000
    9000

    10000
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 24000)
        #expect(day.part1Solution() == 71023)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 45000)
        #expect(day.part2Solution() == 206289)
    }
}
