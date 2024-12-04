import Testing
@testable import AdventOfCode2017

struct Day7Tests {
    let day = Day7()
    
    let input: Input = """
        pbga (66)
        xhth (57)
        ebii (61)
        havc (66)
        ktlj (57)
        fwft (72) -> ktlj, cntj, xhth
        qoyq (66)
        padx (45) -> pbga, havc, qoyq
        tknk (41) -> ugml, padx, fwft
        jptl (61)
        ugml (68) -> gyxo, ebii, jptl
        gyxo (61)
        cntj (57)
        """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "tknk")

        #expect(day.part1Solution() == "xegshds")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "60")

        #expect(day.part2Solution() == "299")
    }
}
