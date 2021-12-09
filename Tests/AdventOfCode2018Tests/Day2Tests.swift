import XCTest
@testable import AdventOfCode2018

final class Day2Tests: XCTestCase {
    let day = Day2()
    
    func testPart1() {
        let input: Input = """
        abcdef
        bababc
        abbcde
        abcccd
        aabcdd
        abcdee
        ababab
        """
        XCTAssertEqual(day.part1Solution(for: input), "12")
    }
    
    func testPart2() {
        let input: Input = """
        abcde
        fghij
        klmno
        pqrst
        fguij
        axcye
        wvxyz
        """
        XCTAssertEqual(day.part2Solution(for: input), "fgij")
    }
}
