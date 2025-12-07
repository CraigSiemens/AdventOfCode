import Testing
import Utilities
@testable import AdventOfCode2025

struct Day6Tests {
    let day = Day6()
    
    let input: Input = """
    123 328  51 64 
     45 64  387 23 
      6 98  215 314
    *   +   *   +  
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 4277556)
        #expect(day.part1Solution() == 7098065460541)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 3263827)
        #expect(day.part2Solution() == 13807151830618)
    }
}
