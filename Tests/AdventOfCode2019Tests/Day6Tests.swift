import XCTest
@testable import AdventOfCode2019

final class Day6Tests: XCTestCase {
    let day = Day6()
    
//    let input = """
//    <#input#>
//    """
    
    func testPart1() {
        let input = """
            COM)B
            B)C
            C)D
            D)E
            E)F
            B)G
            G)H
            D)I
            E)J
            J)K
            K)L
            """
        XCTAssertEqual(day.part1Solution(for: input), "42")
    }
    
    func testPart2() {
        let input = """
            COM)B
            B)C
            C)D
            D)E
            E)F
            B)G
            G)H
            D)I
            E)J
            J)K
            K)L
            K)YOU
            I)SAN
            """
        XCTAssertEqual(day.part2Solution(for: input), "4")
    }
}
