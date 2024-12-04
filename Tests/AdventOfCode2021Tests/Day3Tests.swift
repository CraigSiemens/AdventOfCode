import Testing
@testable import AdventOfCode2021

struct Day3Tests {
    let day = Day3()
    
    let input: Input = """
    00100
    11110
    10110
    10111
    10101
    01111
    00111
    11100
    10000
    11001
    00010
    01010
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "198")
        #expect(day.part1Solution() == "1307354")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "230")
        #expect(day.part2Solution() == "482500")
    }
}
