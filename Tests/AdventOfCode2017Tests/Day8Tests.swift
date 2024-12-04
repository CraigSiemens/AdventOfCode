import Testing
@testable import AdventOfCode2017

struct Day8Tests {
    let day = Day8()
    
    let input: Input = """
        b inc 5 if a > 1
        a inc 1 if b < 5
        c dec -10 if a >= 1
        c inc -20 if c == 10
        """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "1")
        
        #expect(day.part1Solution() == "4066")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "10")
        
        #expect(day.part2Solution() == "4829")
    }
}
