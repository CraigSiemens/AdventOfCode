import Testing
@testable import AdventOfCode2020

struct Day1Tests {
    let day = Day1()
    
    let input: Input = """
    1721
    979
    366
    299
    675
    1456
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "514579")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "241861950")
    }
}
