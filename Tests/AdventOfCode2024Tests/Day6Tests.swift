import Testing
import Utilities
@testable import AdventOfCode2024

struct Day6Tests {
    let day = Day6()
    
    let input: Input = """
    ....#.....
    .........#
    ..........
    ..#.......
    .......#..
    ..........
    .#..^.....
    ........#.
    #.........
    ......#...
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 41)
        #expect(day.part1Solution() == 4967)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 6)
        #expect(day.part2Solution() == 1789)
    }
}
