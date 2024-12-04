import Testing
@testable import AdventOfCode2017

struct Day11Tests {
    let day = Day11()
    
    @Test func part1() {
        #expect(day.part1Solution(for: "ne,ne,ne") == "3")
        #expect(day.part1Solution(for: "ne,ne,sw,sw") == "0")
        #expect(day.part1Solution(for: "ne,ne,s,s") == "2")
        #expect(day.part1Solution(for: "se,sw,se,sw,sw") == "3")


        #expect(day.part1Solution() == "747")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: "ne,ne,ne") == "3")
        #expect(day.part2Solution(for: "ne,ne,sw,sw") == "2")
        #expect(day.part2Solution(for: "ne,ne,s,s") == "2")
        #expect(day.part2Solution(for: "se,sw,se,sw,sw") == "3")

        #expect(day.part2Solution() == "1544")
    }
}
