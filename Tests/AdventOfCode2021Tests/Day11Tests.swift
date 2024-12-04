import Testing
@testable import AdventOfCode2021

struct Day11Tests {
    let day = Day11()
    
    let input: Input = """
    5483143223
    2745854711
    5264556173
    6141336146
    6357385478
    4167524645
    2176841721
    6882881134
    4846848554
    5283751526
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "1656")
        #expect(day.part1Solution() == "1785")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "195")
        #expect(day.part2Solution() == "354")
    }
}
