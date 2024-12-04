import Testing
@testable import AdventOfCode2018

struct Day5Tests {
    let day = Day5()
    
    let input: Input = "dabAcCaCBAcCcaDA"
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "10")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "4")
    }
}
