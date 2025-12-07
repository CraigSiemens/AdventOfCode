import Testing
import Utilities
@testable import AdventOfCode2025

struct Day2Tests {
    let day = Day2()
    
    let input: Input = """
    11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 1227775554)
        #expect(day.part1Solution() == 30599400849)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 4174379265)
        #expect(day.part2Solution() == 46270373595)
    }
}
