import XCTest
@testable import AdventOfCode2021

final class Day10Tests: XCTestCase {
    let day = Day10()
    
    let input: Input = """
    [({(<(())[]>[[{[]{<()<>>
    [(()[<>])]({[<{<<[]>>(
    {([(<{}[<>[]}>{[]{[(<()>
    (((({<>}<{<{<>}{[]{[]{}
    [[<[([]))<([[{}[[()]]]
    [{[{({}]{}}([{[{{{}}([]
    {<[[]]>}<{[{[{[]{()[[[]
    [<(<(<(<{}))><([]([]()
    <{([([[(<>()){}]>(<<{{
    <{([{{}}[<[[[<>{}]]]>[]]
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "26397")
        XCTAssertEqual(day.part1Solution(), "469755")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "288957")
        XCTAssertEqual(day.part2Solution(), "2762335572")
    }
}
