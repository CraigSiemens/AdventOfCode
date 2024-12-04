import Testing
@testable import AdventOfCode2021

struct Day1Tests {
    let day = Day1()
    
    let input: Input = """
    199
    200
    208
    210
    200
    207
    240
    269
    260
    263
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "7")
        #expect(day.part1Solution() == "1162")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "5")
        #expect(day.part2Solution() == "1190")
    }
}
