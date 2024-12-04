import Testing
@testable import AdventOfCode2018

struct Day1Tests {
    let day = Day1()
    
    @Test func part1() {
        #expect(day.part1Solution(for: "+1, -2, +3, +1") == "3")
        #expect(day.part1Solution(for: "+1, +1, +1") == "3")
        #expect(day.part1Solution(for: "+1, +1, -2") == "0")
        #expect(day.part1Solution(for: "-1, -2, -3") == "-6")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: "+1, -2, +3, +1") == "2")
        #expect(day.part2Solution(for: "+1, -1") == "0")
        #expect(day.part2Solution(for: "+3, +3, +4, -2, -4") == "10")
        #expect(day.part2Solution(for: "-6, +3, +8, +5, -6") == "5")
        #expect(day.part2Solution(for: "+7, +7, -2, -7, -4") == "14")
    }
}
