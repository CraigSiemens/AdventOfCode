import Testing
@testable import AdventOfCode2019

struct Day5Tests {
    let day = Day5()
    
    @Test func part1() {
        #expect(day.part1Solution() == "16434972")
    }
    
    @Test func part2() {
        #expect(day.part2Solution() == "16694270")
    }
}
