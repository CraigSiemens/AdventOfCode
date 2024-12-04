import Testing
import Utilities
@testable import AdventOfCode2023

struct Day1Tests {
    let day = Day1()
    
    @Test func part1() {
        let input: Input = """
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
        """
        
        #expect(day.part1Solution(for: input) == 142)
        #expect(day.part1Solution() == 53386)
    }
    
    @Test func part2() {
        let input: Input = """
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen
        """
        
        #expect(day.part2Solution(for: input) == 281)
        #expect(day.part2Solution() == 53312)
    }
}
