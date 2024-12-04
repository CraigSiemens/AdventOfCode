import Testing
@testable import AdventOfCode2017

struct Day22Tests {
    let day = Day22()
    
    let input: Input = """
        ..#
        #..
        ...
        """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "5587")

        #expect(day.part1Solution() == "5447")
    }
    
    @Test func part2() {
//        #expect(day.part2Solution(for: input) == "2511944")

//        #expect(day.part2Solution() == "2511705")
    }
}
