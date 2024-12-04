import Testing
@testable import AdventOfCode2021

struct Day10Tests {
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
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "26397")
        #expect(day.part1Solution() == "469755")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "288957")
        #expect(day.part2Solution() == "2762335572")
    }
}
