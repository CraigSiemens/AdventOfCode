import XCTest
@testable import AdventOfCode2019

final class Day3Tests: XCTestCase {
    let day = Day3()
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: "R8,U5,L5,D3\nU7,R6,D4,L4"), "6")
        XCTAssertEqual(day.part1Solution(for: "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83"), "159")
        XCTAssertEqual(day.part1Solution(for: "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7"), "135")
        
        XCTAssertEqual(day.part1Solution(), "855")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: "R8,U5,L5,D3\nU7,R6,D4,L4"), "30")
        XCTAssertEqual(day.part2Solution(for: "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83"), "610")
        XCTAssertEqual(day.part2Solution(for: "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7"), "410")
        
        XCTAssertEqual(day.part2Solution(), "11238")
    }
}
