import Testing
@testable import AdventOfCode2017

struct Day24Tests {
    let day = Day24()
    
    let input: Input = """
        0/2
        2/2
        2/3
        3/4
        3/5
        0/1
        10/1
        9/10
        """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "31")

//        #expect(day.part1Solution() == "1859")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "19")

//        #expect(day.part2Solution() == "1799")
    }
}
