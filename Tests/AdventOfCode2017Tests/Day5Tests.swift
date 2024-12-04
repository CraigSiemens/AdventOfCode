import Testing
@testable import AdventOfCode2017

struct Day5Tests {
    let day = Day5()
    
    let input: Input = """
        0
        3
        0
        1
        -3
        """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "5")

        #expect(day.part1Solution() == "356945")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "10")

        #expect(day.part2Solution() == "28372145")
    }
}
