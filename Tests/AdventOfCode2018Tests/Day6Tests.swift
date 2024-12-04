import Testing
@testable import AdventOfCode2018

struct Day6Tests {
    let day = Day6()
    
    let input: Input = """
    1, 1
    1, 6
    8, 3
    3, 4
    5, 5
    8, 9
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "17")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input, minDistance: 32) == "16")
    }
}
