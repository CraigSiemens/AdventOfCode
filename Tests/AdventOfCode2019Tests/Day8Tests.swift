import Testing
@testable import AdventOfCode2019

struct Day8Tests {
    let day = Day8()
        
    @Test func part1() {
        #expect(day.part1Solution(for: "123456789089", width: 3, height: 2) == "1")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: "0222112222120000", width: 2, height: 2) == " █\n█ ")
    }
}
