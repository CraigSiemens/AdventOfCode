import Testing
@testable import AdventOfCode2019

struct Day2Tests {
    let day = Day2()
    
    @Test func part1() {
        #expect(day.part1Solution() == "3760627")
    }
    
    @Test func part2() {
        #expect(day.part2Solution() == "7195")
    }
}
