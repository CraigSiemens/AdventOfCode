import Testing
import Utilities
@testable import AdventOfCode2025

struct Day4Tests {
    let day = Day4()
    
    let input: Input = """
    ..@@.@@@@.
    @@@.@.@.@@
    @@@@@.@.@@
    @.@@@@..@.
    @@.@@@@.@@
    .@@@@@@@.@
    .@.@.@.@@@
    @.@@@.@@@@
    .@@@@@@@@.
    @.@.@@@.@.
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 13)
        #expect(day.part1Solution() == 1478)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 43)
        #expect(day.part2Solution() == 9120)
    }
}
