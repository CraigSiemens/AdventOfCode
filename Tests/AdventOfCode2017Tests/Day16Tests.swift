import XCTest
@testable import AdventOfCode2017

final class Day16Tests: XCTestCase {
    let exampleDay = Day16(programSize: 5)
    let day = Day16()
    
    func testPart1() {
        XCTAssertEqual(exampleDay.part1Solution(for: "s1,x3/4,pe/b"), "baedc")

        XCTAssertEqual(day.part1Solution(), "glnacbhedpfjkiom")
    }
    
    func testPart2() {
        XCTAssertEqual(exampleDay.part2Solution(for: "s1,x3/4,pe/b"), "abcde")

        XCTAssertEqual(day.part2Solution(), "fmpanloehgkdcbji")
    }
}
