import XCTest
@testable import AdventOfCode2017

final class Day20Tests: XCTestCase {
    let day = Day20()
    
    func testPart1() {
        let input: Input = """
            p=< 3,0,0>, v=< 2,0,0>, a=<-1,0,0>
            p=< 4,0,0>, v=< 0,0,0>, a=<-2,0,0>
            """
        XCTAssertEqual(day.part1Solution(for: input), "0")

//        XCTAssertEqual(day.part1Solution(), "376")
    }
    
    func testPart2() {
        let input: Input = """
            p=<-6,0,0>, v=< 3,0,0>, a=< 0,0,0>
            p=<-4,0,0>, v=< 2,0,0>, a=< 0,0,0>
            p=<-2,0,0>, v=< 1,0,0>, a=< 0,0,0>
            p=< 3,0,0>, v=<-1,0,0>, a=< 0,0,0>
            """
        XCTAssertEqual(day.part2Solution(for: input), "1")
        
//        XCTAssertEqual(day.part2Solution(), "574")
    }
}
