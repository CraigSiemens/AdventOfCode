import Testing
import Utilities
@testable import AdventOfCode2022

struct Day12Tests {
    let day = Day12()
    
    let input: Input = """
    Sabqponm
    abcryxxl
    accszExk
    acctuvwj
    abdefghi
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 31)
        #expect(day.part1Solution() == 481)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 29)
        #expect(day.part2Solution() == 480)
    }
}
