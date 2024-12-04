import Testing
@testable import AdventOfCode2017

struct Day19Tests {
    let day = Day19()
    
    let input: Input = """
             |
             |  +--+
             A  |  C
         F---|----E|--+
             |  |  |  D
             +B-+  +--+

        """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "ABCDEF")

        #expect(day.part1Solution() == "GEPYAWTMLK")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "38")

        #expect(day.part2Solution() == "17628")
    }
}
