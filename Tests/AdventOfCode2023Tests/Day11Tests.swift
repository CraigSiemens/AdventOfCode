import Testing
import Utilities
@testable import AdventOfCode2023

struct Day11Tests {
    let day = Day11()
    
    let input: Input = """
    ...#......
    .......#..
    #.........
    ..........
    ......#...
    .#........
    .........#
    ..........
    .......#..
    #...#.....
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 374)
        #expect(day.part1Solution() == 9639160)
    }
    
    @Test func part2() {
        #expect(day.solution(for: input, expansion: 10) == 1030)
        #expect(day.solution(for: input, expansion: 100) == 8410)
        #expect(day.part2Solution() == 752936133304)
    }
}
