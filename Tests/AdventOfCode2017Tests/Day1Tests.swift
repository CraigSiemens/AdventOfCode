import XCTest
@testable import AdventOfCode2017

final class Day1Tests: XCTestCase {
    let day = Day1()
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: "1122"), "3")
        XCTAssertEqual(day.part1Solution(for: "1111"), "4")
        XCTAssertEqual(day.part1Solution(for: "1234"), "0")
        XCTAssertEqual(day.part1Solution(for: "91212129"), "9")
        
        XCTAssertEqual(day.part1Solution(), "1343")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: "1212"), "6")
        XCTAssertEqual(day.part2Solution(for: "1221"), "0")
        XCTAssertEqual(day.part2Solution(for: "123425"), "4")
        XCTAssertEqual(day.part2Solution(for: "123123"), "12")
        XCTAssertEqual(day.part2Solution(for: "12131415"), "4")
        
        XCTAssertEqual(day.part2Solution(), "1274")
    }
}
