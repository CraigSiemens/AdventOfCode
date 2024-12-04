import Testing
@testable import AdventOfCode2021

struct Day6Tests {
    let day = Day6()
    
    let input: Input = """
    3,4,3,1,2
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "5934")
        #expect(day.part1Solution() == "359344")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "26984457539")
        #expect(day.part2Solution() == "1629570219571")
    }
}
