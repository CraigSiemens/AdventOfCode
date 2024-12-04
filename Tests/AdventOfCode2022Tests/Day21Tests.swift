import Testing
import Utilities
@testable import AdventOfCode2022

struct Day21Tests {
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
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 152)
        #expect(day.part1Solution() == 331319379445180)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 301)
        #expect(day.part2Solution() == 3715799488132)
    }
}
