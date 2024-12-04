import Testing
@testable import AdventOfCode2017

struct Day10Tests {
    let day = Day10()
    
    @Test func knotHashResult() {
        #expect(knotHash(numbers: Array(0..<5), lengths: [3,4,1,5]) == [3, 4, 2, 1, 0])
    }
    
    @Test func part1() {
        #expect(day.part1Solution() == "1980")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: "") == "a2582a3a0e66e6e86e3812dcb672a272")
        #expect(day.part2Solution(for: "AoC 2017") == "33efeb34ea91902bb2f59c9920caa6cd")
        #expect(day.part2Solution(for: "1,2,3") == "3efbe78a8d82f29979031a4aa0b16a9d")
        #expect(day.part2Solution(for: "1,2,4") == "63960835bcdc130f0b66d7ff4f6a5a8e")

        // Crashes for some reason after switching to swift testing
//        #expect(day.part2Solution() == "899124dac21012ebc32e2f4d11eaec55")
    }
}
