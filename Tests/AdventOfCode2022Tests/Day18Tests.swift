import Testing
import Utilities
@testable import AdventOfCode2022

struct Day18Tests {
    let day = Day18()
    
    let smallInput: Input = """
    0,-1,0
    -1,0,0
    1,0,0
    0,0,-1
    0,0,1
    0,1,0
    """
    
    let mediumInput: Input = """
    2,2,2
    1,2,2
    3,2,2
    2,1,2
    2,3,2
    2,2,1
    2,2,3
    2,2,4
    2,2,6
    1,2,5
    3,2,5
    2,1,5
    2,3,5
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: smallInput) == 36)
        #expect(day.part1Solution(for: mediumInput) == 64)
        #expect(day.part1Solution() == 3374)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: smallInput) == 30)
        #expect(day.part2Solution(for: mediumInput) == 58)
        #expect(day.part2Solution() == 2010)
    }
}
