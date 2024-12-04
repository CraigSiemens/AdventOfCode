import Testing
@testable import AdventOfCode2018

struct Day11Tests {
    let day = Day11()
    
    @Test func part1() {
        #expect(day.value(for: 8, x: 3, y: 5) == 4)
        #expect(day.value(for: 57, x: 121, y: 78) == -5)
        #expect(day.value(for: 39, x: 217, y: 196) == 0)
        #expect(day.value(for: 71, x: 101, y: 153) == 4)
        
        #expect(day.part1Solution(for: "18") == "33,45")
        #expect(day.part1Solution(for: "42") == "21,61")
    }
    
    @Test func part2() {
//        #expect(day.part2Solution(for: "18") == "90,269,16")
//        #expect(day.part2Solution(for: "42") == "232,251,12")
    }
}
