import Testing
import Utilities
@testable import AdventOfCode2025

struct Day3Tests {
    let day = Day3()
    
    let input: Input = """
    987654321111111
    811111111111119
    234234234234278
    818181911112111
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 357)
        #expect(day.part1Solution() == 17074)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 3121910778619)
        #expect(day.part2Solution() == 169512729575727)
    }
}
