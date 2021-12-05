import XCTest
@testable import AdventOfCode2017

final class Day7Tests: XCTestCase {
    let day = Day7()
    
    let input = """
        pbga (66)
        xhth (57)
        ebii (61)
        havc (66)
        ktlj (57)
        fwft (72) -> ktlj, cntj, xhth
        qoyq (66)
        padx (45) -> pbga, havc, qoyq
        tknk (41) -> ugml, padx, fwft
        jptl (61)
        ugml (68) -> gyxo, ebii, jptl
        gyxo (61)
        cntj (57)
        """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "tknk")

        XCTAssertEqual(day.part1Solution(), "xegshds")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "60")

        XCTAssertEqual(day.part2Solution(), "299")
    }
}
