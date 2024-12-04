import Testing
import Utilities
@testable import AdventOfCode2022

struct Day13Tests {
    let day = Day13()
    
    let input: Input = """
    [1,1,3,1,1]
    [1,1,5,1,1]
    
    [[1],[2,3,4]]
    [[1],4]
    
    [9]
    [[8,7,6]]
    
    [[4,4],4,4]
    [[4,4],4,4,4]
    
    [7,7,7,7]
    [7,7,7]
    
    []
    [3]
    
    [[[]]]
    [[]]
    
    [1,[2,[3,[4,[5,6,7]]]],8,9]
    [1,[2,[3,[4,[5,6,0]]]],8,9]
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 13)
        #expect(day.part1Solution() == 5760)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 140)
        #expect(day.part2Solution() == 26670)
    }
}
