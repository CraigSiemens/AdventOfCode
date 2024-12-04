import Testing
import Utilities
@testable import AdventOfCode2023

struct Day13Tests {
    let day = Day13()
    
    let input: Input = """
    #.##..##.
    ..#.##.#.
    ##......#
    ##......#
    ..#.##.#.
    ..##..##.
    #.#.##.#.
    
    #...##..#
    #....#..#
    ..##..###
    #####.##.
    #####.##.
    ..##..###
    #....#..#
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 405)
        #expect(day.part1Solution() == 40006)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 400)
        #expect(day.part2Solution() == 28627)
    }
}
