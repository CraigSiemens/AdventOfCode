import Testing
@testable import AdventOfCode2019

struct Day11Tests {
    let day = Day11()
    
    @Test func part1() {
        #expect(day.part1Solution() == "1747")
    }
    
    @Test func part2() {
        #expect(day.part2Solution() == "ZCGRHKLB")
    }
}
