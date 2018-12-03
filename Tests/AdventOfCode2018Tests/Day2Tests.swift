import XCTest
@testable import Day2

final class Day2Tests: XCTestCase {
    let day = Day2()
    
    func testPart1() {
        let input = """
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
        let input = """
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
