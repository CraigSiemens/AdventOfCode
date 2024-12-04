import Testing
@testable import AdventOfCode2020

struct Day2Tests {
    let day = Day2()
    
    let input: Input = """
    1-3 a: abcde
    1-3 b: cdefg
    2-9 c: ccccccccc
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "2")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "1")
    }
}
