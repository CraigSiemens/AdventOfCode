import XCTest
@testable import AdventOfCode2017

final class Day18Tests: XCTestCase {
    let day = Day18()
    
    func testPart1() {
        let input: Input = """
            set a 1
            add a 2
            mul a a
            mod a 5
            snd a
            set a 0
            rcv a
            jgz a -1
            set a 1
            jgz a -2
            """
        XCTAssertEqual(day.part1Solution(for: input), "4")
        
        XCTAssertEqual(day.part1Solution(), "8600")
    }
    
    func testPart2() {
        let input: Input = """
            snd 1
            snd 2
            snd p
            rcv a
            rcv b
            rcv c
            rcv d
            """
        XCTAssertEqual(day.part2Solution(for: input), "3")

        XCTAssertEqual(day.part2Solution(), "7239")
    }
}
