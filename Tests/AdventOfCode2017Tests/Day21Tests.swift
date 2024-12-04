import Testing
@testable import AdventOfCode2017

struct Day21Tests {
    let day = Day21()
    
    let input: Input = """
        ../.# => ##./#../...
        .#./..#/### => #..#/..../..../#..#
        """
    
    @Test func part1() {
        #expect(Day21(iterations: 2).part1Solution(for: input) == "12")

        #expect(day.part1Solution() == "162")
    }
    
    @Test func part2() {
//        #expect(day.part2Solution() == "2264586")
    }
}
