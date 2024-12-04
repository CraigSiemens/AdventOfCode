import Testing
import Utilities
@testable import AdventOfCode2022

struct Day5Tests {
    let day = Day5()
    
    let input: Input = """
        [D]
    [N] [C]
    [Z] [M] [P]
     1   2   3

    move 1 from 2 to 1
    move 3 from 1 to 3
    move 2 from 2 to 1
    move 1 from 1 to 2
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "CMZ")
        #expect(day.part1Solution() == "WHTLRMZRC")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "MCD")
        #expect(day.part2Solution() == "GMPMLWNMG")
    }
}
