import Testing
import Utilities
@testable import AdventOfCode2024

struct Day3Tests {
    let day = Day3()
    
    @Test func part1() {
        let input: Input = """
        xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
        """
        #expect(day.part1Solution(for: input) == 161)
        #expect(day.part1Solution() == 183788984)
    }
    
    @Test func part2() {
        let input: Input = """
        xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
        """
        #expect(day.part2Solution(for: input) == 48)
        #expect(day.part2Solution() == 62098619)
    }
}
