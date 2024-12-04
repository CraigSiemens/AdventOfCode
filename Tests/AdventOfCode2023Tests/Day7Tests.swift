import Testing
import Utilities
@testable import AdventOfCode2023

struct Day7Tests {
    let day = Day7()
    
    let input: Input = """
    32T3K 765
    T55J5 684
    KK677 28
    KTJJT 220
    QQQJA 483
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 6440)
        #expect(day.part1Solution() == 248113761)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 5905)
        #expect(day.part2Solution() == 246285222)
    }
}
