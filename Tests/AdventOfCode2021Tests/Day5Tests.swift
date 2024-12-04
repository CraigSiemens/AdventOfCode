import Testing
@testable import AdventOfCode2021

struct Day5Tests {
    let day = Day5()
    
    let input: Input = """
    0,9 -> 5,9
    8,0 -> 0,8
    9,4 -> 3,4
    2,2 -> 2,1
    7,0 -> 7,4
    6,4 -> 2,0
    0,9 -> 2,9
    3,4 -> 1,4
    0,0 -> 8,8
    5,5 -> 8,2
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "5")
        #expect(day.part1Solution() == "5124")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "12")
        #expect(day.part2Solution() == "19771")
    }
}
