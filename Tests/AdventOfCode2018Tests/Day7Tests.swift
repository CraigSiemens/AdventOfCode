import Testing
@testable import AdventOfCode2018

struct Day7Tests {
    let day = Day7()
    
    let input: Input = """
    Step C must be finished before step A can begin.
    Step C must be finished before step F can begin.
    Step A must be finished before step B can begin.
    Step A must be finished before step D can begin.
    Step B must be finished before step E can begin.
    Step D must be finished before step E can begin.
    Step F must be finished before step E can begin.
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "CABDFE")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input, workers: 2, baseDuration: 0) == "15")
    }
}
