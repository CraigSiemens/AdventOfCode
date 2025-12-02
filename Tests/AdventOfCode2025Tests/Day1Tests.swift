import Testing
import Utilities
@testable import AdventOfCode2025

struct Day1Tests {
    let day = Day1()
    
    let input: Input = """
    L68
    L30
    R48
    L5
    R60
    L55
    L1
    L99
    R14
    L82
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 3)
        #expect(day.part1Solution() == 1139)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: "R150") == 2)
        #expect(day.part2Solution(for: "L50\nL1") == 1)
        #expect(day.part2Solution(for: "L50\nR50") == 1)
        #expect(day.part2Solution(for: "L650") == 7)
        
        #expect(day.part2Solution(for: input) == 6)
        #expect(day.part2Solution() == 6684)
    }
}
