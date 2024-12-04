import Testing
@testable import AdventOfCode2017

struct Day16Tests {
    let exampleDay = Day16(programSize: 5)
    let day = Day16()
    
    @Test func part1() {
        #expect(exampleDay.part1Solution(for: "s1,x3/4,pe/b") == "baedc")

        #expect(day.part1Solution() == "glnacbhedpfjkiom")
    }
    
    @Test func part2() {
        #expect(exampleDay.part2Solution(for: "s1,x3/4,pe/b") == "abcde")

        #expect(day.part2Solution() == "fmpanloehgkdcbji")
    }
}
