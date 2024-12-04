import Testing
@testable import AdventOfCode2021

struct Day9Tests {
    let day = Day9()
    
    let input: Input = """
    2199943210
    3987894921
    9856789892
    8767896789
    9899965678
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "15")
        #expect(day.part1Solution() == "480")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "1134")
        #expect(day.part2Solution() == "1045660")
    }
}
