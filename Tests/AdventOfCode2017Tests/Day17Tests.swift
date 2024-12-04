import Testing
@testable import AdventOfCode2017

struct Day17Tests {
    let day = Day17()
    
    @Test func part1() {
        #expect(day.part1Solution(for: "3") == "638")

        #expect(day.part1Solution() == "725")
    }
    
    @Test func part2() {
        // Slow
//        #expect(day.part2Solution() == "27361412")
    }
}
