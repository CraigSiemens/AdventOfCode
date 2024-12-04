import Testing
@testable import AdventOfCode2017

struct Day4Tests {
    let day = Day4()
    
    @Test func part1() {
        #expect(day.part1Solution(for: "aa bb cc dd ee") == "1")
        #expect(day.part1Solution(for: "aa bb cc dd aa") == "0")
        #expect(day.part1Solution(for: "aa bb cc dd aaa") == "1")

        #expect(day.part1Solution() == "386")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: "abcde fghij") == "1")
        #expect(day.part2Solution(for: "abcde xyz ecdab") == "0")
        #expect(day.part2Solution(for: "a ab abc abd abf abj") == "1")
        #expect(day.part2Solution(for: "iiii oiii ooii oooi oooo") == "1")
        #expect(day.part2Solution(for: "oiii ioii iioi iiio") == "0")

        #expect(day.part2Solution() == "208")
    }
}
