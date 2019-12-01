import XCTest
@testable import AdventOfCode2018

final class Day14Tests: XCTestCase {
    let day = Day14()
    
//    let input = """
//    <#input#>
//    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: "9"), "5158916779")
        XCTAssertEqual(day.part1Solution(for: "5"), "0124515891")
        XCTAssertEqual(day.part1Solution(for: "18"), "9251071085")
        XCTAssertEqual(day.part1Solution(for: "2018"), "5941429882")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: "51589"), "9")
        XCTAssertEqual(day.part2Solution(for: "01245"), "5")
        XCTAssertEqual(day.part2Solution(for: "92510"), "18")
        XCTAssertEqual(day.part2Solution(for: "59414"), "2018")
    }
}
