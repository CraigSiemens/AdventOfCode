import Testing
@testable import AdventOfCode2021

struct Day2Tests {
    let day = Day2()
    
    let input: Input = """
    forward 5
    down 5
    forward 8
    up 3
    down 8
    forward 2
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "150")
        #expect(day.part1Solution() == "1499229")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "900")
        #expect(day.part2Solution() == "1340836560")
    }
}
