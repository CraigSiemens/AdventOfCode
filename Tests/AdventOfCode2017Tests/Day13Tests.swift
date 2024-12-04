import Testing
@testable import AdventOfCode2017

struct Day13Tests {
    let day = Day13()
    
    let input: Input = """
        0: 3
        1: 2
        4: 4
        6: 4
        """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "24")

        #expect(day.part1Solution() == "2160")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "10")

        // Slow
//        #expect(day.part2Solution() == "3907470")
    }
}
