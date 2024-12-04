import Testing
@testable import AdventOfCode2018

struct Day8Tests {
    let day = Day8()
    
    let input: Input = """
    2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "138")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "66")
    }
}
