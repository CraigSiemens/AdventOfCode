import Testing
import Utilities
@testable import AdventOfCode2024

struct Day4Tests {
    let day = Day4()
    
    let input: Input = """
    MMMSXXMASM
    MSAMXMSMSA
    AMXSXMAAMM
    MSAMASMSMX
    XMASAMXAMM
    XXAMMXXAMA
    SMSMSASXSS
    SAXAMASAAA
    MAMMMXMMMM
    MXMXAXMASX
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 18)
        #expect(day.part1Solution() == 2554)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 9)
        #expect(day.part2Solution() == 1916)
    }
}
