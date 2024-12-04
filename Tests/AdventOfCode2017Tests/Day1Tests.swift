import Testing
@testable import AdventOfCode2017

struct Day1Tests {
    let day = Day1()
    
    @Test func part1() {
        #expect(day.part1Solution(for: "1122") == "3")
        #expect(day.part1Solution(for: "1111") == "4")
        #expect(day.part1Solution(for: "1234") == "0")
        #expect(day.part1Solution(for: "91212129") == "9")
        
        #expect(day.part1Solution() == "1343")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: "1212") == "6")
        #expect(day.part2Solution(for: "1221") == "0")
        #expect(day.part2Solution(for: "123425") == "4")
        #expect(day.part2Solution(for: "123123") == "12")
        #expect(day.part2Solution(for: "12131415") == "4")
        
        #expect(day.part2Solution() == "1274")
    }
}
