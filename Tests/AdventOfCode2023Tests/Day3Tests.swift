import Testing
import Utilities
@testable import AdventOfCode2023

struct Day3Tests {
    let day = Day3()
    
    let input: Input = """
    467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 4361)
        #expect(day.part1Solution() == 532428)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 467835)
        #expect(day.part2Solution() == 84051670)
    }
}
