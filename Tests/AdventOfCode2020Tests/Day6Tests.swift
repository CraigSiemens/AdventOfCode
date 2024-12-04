import Testing
@testable import AdventOfCode2020

struct Day6Tests {
    let day = Day6()
    
    let input: Input = """
    abc

    a
    b
    c

    ab
    ac

    a
    a
    a
    a

    b
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "11")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "6")
    }
}
