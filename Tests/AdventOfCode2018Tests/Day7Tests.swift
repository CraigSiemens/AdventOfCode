import XCTest
@testable import Day7

final class Day7Tests: XCTestCase {
    let day = Day7()
    
    let input = """
    Step C must be finished before step A can begin.
    Step C must be finished before step F can begin.
    Step A must be finished before step B can begin.
    Step A must be finished before step D can begin.
    Step B must be finished before step E can begin.
    Step D must be finished before step E can begin.
    Step F must be finished before step E can begin.
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "CABDFE")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input, workers: 2, baseDuration: 0), "15")
    }
}
