import Testing
import Utilities
@testable import AdventOfCode2022

struct Day6Tests {
    let day = Day6()
    
    @Test func part1() {
        #expect(day.part1Solution(for: "mjqjpqmgbljsphdztnvjfqwrcgsmlb") == 7)
        #expect(day.part1Solution(for: "bvwbjplbgvbhsrlpgdmjqwftvncz") == 5)
        #expect(day.part1Solution(for: "nppdvjthqldpwncqszvftbrmjlhg") == 6)
        #expect(day.part1Solution(for: "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg") == 10)
        #expect(day.part1Solution(for: "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw") == 11)
        
        #expect(day.part1Solution() == 1238)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: "mjqjpqmgbljsphdztnvjfqwrcgsmlb") == 19)
        #expect(day.part2Solution(for: "bvwbjplbgvbhsrlpgdmjqwftvncz") == 23)
        #expect(day.part2Solution(for: "nppdvjthqldpwncqszvftbrmjlhg") == 23)
        #expect(day.part2Solution(for: "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg") == 29)
        #expect(day.part2Solution(for: "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw") == 26)
        
        #expect(day.part2Solution() == 3037)
    }
}
