import Testing
import Utilities
@testable import AdventOfCode2022

struct Day3Tests {
    let day = Day3()
    
    let input: Input = """
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 157)
        #expect(day.part1Solution() == 7811)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 70)
        
        if #available(macOS 13, *) {
            // https://davedelong.com/blog/2022/12/03/adventures-in-advent-of-code/
            #expect(day.part2Solution() == 2639)
        }
    }
}
