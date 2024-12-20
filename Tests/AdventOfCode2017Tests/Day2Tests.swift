import Testing
@testable import AdventOfCode2017

struct Day2Tests {
    let day = Day2()
    
    @Test func part1() {
        #expect(day.part1Solution(for: "5 1 9 5") == "8")
        #expect(day.part1Solution(for: "7 5 3") == "4")
        #expect(day.part1Solution(for: "2 4 6 8") == "6")

        let input: Input = """
        5 1 9 5
        7 5 3
        2 4 6 8
        """
        #expect(day.part1Solution(for: input) == "18")
        
        #expect(day.part1Solution() == "58975")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: "5 9 2 8") == "4")
        #expect(day.part2Solution(for: "9 4 7 3") == "3")
        #expect(day.part2Solution(for: "3 8 6 5") == "2")

        let input: Input = """
        5 9 2 8
        9 4 7 3
        3 8 6 5
        """
        #expect(day.part2Solution(for: input) == "9")
        
        #expect(day.part2Solution() == "308")

    }
}
