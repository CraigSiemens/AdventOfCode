import Testing
@testable import AdventOfCode2017

struct Day12Tests {
    let day = Day12()
    
    let input: Input = """
        0 <-> 2
        1 <-> 1
        2 <-> 0, 3, 4
        3 <-> 2, 4
        4 <-> 2, 3, 6
        5 <-> 6
        6 <-> 4, 5
        """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "6")

        #expect(day.part1Solution() == "306")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "2")

        #expect(day.part2Solution() == "200")
    }
}
