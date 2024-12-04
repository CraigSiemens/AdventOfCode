import Testing
@testable import AdventOfCode2019

struct Day4Tests {
    let day = Day4()
    
    @Test func part1() {
        #expect(day.isValidPassword(111111, strict: false) == true)
        #expect(day.isValidPassword(223450, strict: false) == false)
        #expect(day.isValidPassword(123789, strict: false) == false)
        
        #expect(day.part1Solution(for: "111110-111120") == "9")
    }
    
    @Test func part2() {
        #expect(day.isValidPassword(112233, strict: true) == true)
        #expect(day.isValidPassword(123444, strict: true) == false)
        #expect(day.isValidPassword(111122, strict: true) == true)

        #expect(day.part2Solution(for: "111110-111125") == "1")
    }
}
