import Testing
import Utilities
@testable import AdventOfCode2024

struct Day5Tests {
    let day = Day5()
    
    let input: Input = """
    47|53
    97|13
    97|61
    97|47
    75|29
    61|13
    75|53
    29|13
    97|29
    53|29
    61|53
    97|53
    61|29
    47|13
    75|47
    97|75
    47|61
    75|61
    47|29
    75|13
    53|13

    75,47,61,53,29
    97,61,53,29,13
    75,29,13
    75,97,47,61,53
    61,13,29
    97,13,75,29,47
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 143)
        #expect(day.part1Solution() == 4609)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 123)
        #expect(day.part2Solution() == 5723)
    }
}
