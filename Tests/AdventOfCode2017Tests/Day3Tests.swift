import Testing
@testable import AdventOfCode2017

struct Day3Tests {
    let day = Day3()
    
    @Test func part1() {
        #expect(day.part1Solution(for: "1") == "0")
        #expect(day.part1Solution(for: "12") == "3")
        #expect(day.part1Solution(for: "23") == "2")
        #expect(day.part1Solution(for: "1024") == "31")
        
        #expect(day.part1Solution() == "480")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: "800") == "806")
        
        #expect(day.part2Solution() == "349975")
    }
}
