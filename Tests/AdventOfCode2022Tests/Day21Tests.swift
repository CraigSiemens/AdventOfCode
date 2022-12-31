import Utilities
import XCTest
@testable import AdventOfCode2022

final class Day21Tests: XCTestCase {
    let day = Day21()
    
    let input: Input = """
    root: pppw + sjmn
    dbpl: 5
    cczh: sllz + lgvd
    zczc: 2
    ptdq: humn - dvpt
    dvpt: 3
    lfqf: 4
    humn: 5
    ljgn: 2
    sjmn: drzm * dbpl
    sllz: 4
    pppw: cczh / lfqf
    lgvd: ljgn * ptdq
    drzm: hmdt - zczc
    hmdt: 32
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), 152)
        XCTAssertEqual(day.part1Solution(), 331319379445180)
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), 301)
        XCTAssertEqual(day.part2Solution(), 3715799488132)
    }
}
