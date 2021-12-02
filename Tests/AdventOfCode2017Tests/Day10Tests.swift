import XCTest
@testable import AdventOfCode2017

final class Day10Tests: XCTestCase {
    let day = Day10()
    
    func testKnotHash() {
        XCTAssertEqual(knotHash(numbers: Array(0..<5), lengths: [3,4,1,5]), [3, 4, 2, 1, 0])
    }
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(), "1980")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: ""), "a2582a3a0e66e6e86e3812dcb672a272")
        XCTAssertEqual(day.part2Solution(for: "AoC 2017"), "33efeb34ea91902bb2f59c9920caa6cd")
        XCTAssertEqual(day.part2Solution(for: "1,2,3"), "3efbe78a8d82f29979031a4aa0b16a9d")
        XCTAssertEqual(day.part2Solution(for: "1,2,4"), "63960835bcdc130f0b66d7ff4f6a5a8e")

        XCTAssertEqual(day.part2Solution(), "899124dac21012ebc32e2f4d11eaec55")
    }
}
