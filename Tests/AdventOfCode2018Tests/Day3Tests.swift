import Testing
@testable import AdventOfCode2018

struct Day3Tests {
    let day = Day3()
    let input: Input = """
        #1 @ 1,3: 4x4
        #2 @ 3,1: 4x4
        #3 @ 5,5: 2x2
        """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "4")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "3")
    }
}
