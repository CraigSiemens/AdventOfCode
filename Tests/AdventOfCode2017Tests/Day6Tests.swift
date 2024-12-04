import Testing
@testable import AdventOfCode2017

struct Day6Tests {
    let day = Day6()
    
    @Test func part1() {
        #expect(day.part1Solution(for: "0 2 7 0") == "5")

        #expect(day.part1Solution() == "7864")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: "0 2 7 0") == "4")

        #expect(day.part2Solution() == "1695")
    }
}
