import Testing
@testable import AdventOfCode2021

struct Day14Tests {
    let day = Day14()
    
    let input: Input = """
    NNCB

    CH -> B
    HH -> N
    CB -> H
    NH -> C
    HB -> C
    HC -> B
    HN -> C
    NN -> C
    BH -> H
    NC -> B
    NB -> B
    BN -> B
    BB -> N
    BC -> B
    CC -> N
    CN -> C
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "1588")
        #expect(day.part1Solution() == "2360")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == "2188189693529")
        #expect(day.part2Solution() == "2967977072188")
    }
}
