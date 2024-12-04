import Testing
import Utilities
@testable import AdventOfCode2023

struct Day12Tests {
    let day = Day12()
    
    let input: Input = """
    ???.### 1,1,3
    .??..??...?##. 1,1,3
    ?#?#?#?#?#?#?#? 1,3,1,6
    ????.#...#... 4,1,1
    ????.######..#####. 1,6,5
    ?###???????? 3,2,1
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 21)
        #expect(day.part1Solution() == 7857)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 525152)
        #expect(day.part2Solution() == 28606137449920)
    }
}
