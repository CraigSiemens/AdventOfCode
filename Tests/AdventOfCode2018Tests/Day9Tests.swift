import Testing
@testable import AdventOfCode2018

struct Day9Tests {
    let day = Day9()
        
    @Test func part1() {
        #expect(day.part1Solution(for: "9 players; last marble is worth 25 points") == "32")
        #expect(day.part1Solution(for: "10 players; last marble is worth 1618 points") == "8317")
        #expect(day.part1Solution(for: "13 players; last marble is worth 7999 points") == "146373")
        #expect(day.part1Solution(for: "17 players; last marble is worth 1104 points") == "2764")
        #expect(day.part1Solution(for: "21 players; last marble is worth 6111 points") == "54718")
        #expect(day.part1Solution(for: "30 players; last marble is worth 5807 points") == "37305")
    }
    
    @Test func part2() {
        // No example given, final answer takes ~8 sec
//        #expect(day.part2Solution() == "3412522480")
    }
}
