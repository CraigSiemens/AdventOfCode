import Testing
@testable import AdventOfCode2017

struct Day9Tests {
    let day = Day9()
    
    @Test func part1() {
        #expect(day.part1Solution(for: "{}") == "1")
        #expect(day.part1Solution(for: "{{{}}}") == "6")
        #expect(day.part1Solution(for: "{{},{}}") == "5")
        #expect(day.part1Solution(for: "{{{},{},{{}}}}") == "16")
        #expect(day.part1Solution(for: "{<a>,<a>,<a>,<a>}") == "1")
        #expect(day.part1Solution(for: "{{<ab>},{<ab>},{<ab>},{<ab>}}") == "9")
        #expect(day.part1Solution(for: "{{<!!>},{<!!>},{<!!>},{<!!>}}") == "9")
        #expect(day.part1Solution(for: "{{<a!>},{<a!>},{<a!>},{<ab>}}") == "3")

        #expect(day.part1Solution() == "23588")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: "{<>}") == "0")
        #expect(day.part2Solution(for: "{<random characters>}") == "17")
        #expect(day.part2Solution(for: "{<<<<>}") == "3")
        #expect(day.part2Solution(for: "{<{!>}>}") == "2")
        #expect(day.part2Solution(for: "{<!!>}") == "0")
        #expect(day.part2Solution(for: "{<!!!>>}") == "0")
        #expect(day.part2Solution(for: "{<{o\"i!a,<{i<a>}") == "10")

        #expect(day.part2Solution() == "10045")
    }
}
