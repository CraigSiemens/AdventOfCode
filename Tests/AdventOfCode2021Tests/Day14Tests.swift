import XCTest
@testable import AdventOfCode2021

final class Day14Tests: XCTestCase {
    let day = Day14()
    
    let input: Input = """
    NNCB

    CH -> B
    HH -> N
    CB -> H
    NH -> C
    HB -> C
    HC -> B
    HN -> C
    NN -> C
    BH -> H
    NC -> B
    NB -> B
    BN -> B
    BB -> N
    BC -> B
    CC -> N
    CN -> C
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "1588")
        XCTAssertEqual(day.part1Solution(), "2360")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "2188189693529")
        XCTAssertEqual(day.part2Solution(), "2967977072188")
    }
}
