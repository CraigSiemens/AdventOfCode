import Testing
import Utilities
@testable import AdventOfCode2024

struct Day8Tests {
    let day = Day8()
    
    let input: Input = """
    ............
    ........0...
    .....0......
    .......0....
    ....0.......
    ......A.....
    ............
    ............
    ........A...
    .........A..
    ............
    ............
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 14)
        #expect(day.part1Solution() == 320)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 34)
        #expect(day.part2Solution() == 1157)
    }
}
