import Testing
import Utilities
@testable import AdventOfCode2022

struct Day22Tests {
    let day = Day22()
    
    let input: Input = """
            ...#
            .#..
            #...
            ....
    ...#.......#
    ........#...
    ..#....#....
    ..........#.
            ...#....
            .....#..
            .#......
            ......#.
    
    10R5L5R10L4R5L5
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 6032)
        #expect(day.part1Solution() == 165094)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 5031)
        #expect(day.part2Solution() == 95316)
    }
}
