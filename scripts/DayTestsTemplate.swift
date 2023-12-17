import Utilities
import XCTest
@testable import AdventOfCode{YEAR_NUMBER}

final class {DAY_NAME}Tests: XCTestCase {
    let day = {DAY_NAME}()
    
//    let input: Input = """
//    <#input#>
//    """
    
    func testPart1() {
//        XCTAssertEqual(day.part1Solution(for: input), <#{RETURN_VALUE}#>)
//        XCTAssertEqual(day.part1Solution(for: "<#input#>"), <#{RETURN_VALUE}#>)
        XCTAssertEqual(day.part1Solution(), {RETURN_VALUE})
    }
    
    func testPart2() {
//        XCTAssertEqual(day.part2Solution(for: input), <#{RETURN_VALUE}#>)
//        XCTAssertEqual(day.part2Solution(for: "<#input#>"), <#{RETURN_VALUE}#>)
        XCTAssertEqual(day.part2Solution(), {RETURN_VALUE})
    }
}
