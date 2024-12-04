import Testing
import Utilities
@testable import AdventOfCode2022

struct Day8Tests {
    let day = Day8()
    
    let input: Input = """
    30373
    25512
    65332
    33549
    35390
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 21)
        #expect(day.part1Solution() == 1672)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 8)
        #expect(day.part2Solution() == 327180)
    }
}
