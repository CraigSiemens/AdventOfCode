import Testing
@testable import AdventOfCode2021

struct Day7Tests {
    let day = Day7()
    
    let input: Input = """
    16,1,2,0,4,2,7,1,2,14
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "37")
        #expect(day.part1Solution() == "354129")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "168")
        #expect(day.part2Solution() == "98905973")
    }
}
