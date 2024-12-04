import Testing
@testable import AdventOfCode2020

struct Day3Tests {
    let day = Day3()
    
    let input: Input = """
    ..##.......
    #...#...#..
    .#....#..#.
    ..#.#...#.#
    .#...##..#.
    ..#.##.....
    .#.#.#....#
    .#........#
    #.##...#...
    #...##....#
    .#..#...#.#
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "7")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "336")
    }
}
