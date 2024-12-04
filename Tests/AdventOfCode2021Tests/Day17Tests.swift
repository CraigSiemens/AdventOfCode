import Testing
@testable import AdventOfCode2021

struct Day17Tests {
    let day = Day17()
    
    let input: Input = """
    target area: x=20..30, y=-10..-5
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "45")
        #expect(day.part1Solution() == "9730")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "112")
        #expect(day.part2Solution() == "4110")
    }
}
