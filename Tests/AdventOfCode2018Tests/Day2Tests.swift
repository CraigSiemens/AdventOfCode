import Testing
@testable import AdventOfCode2018

struct Day2Tests {
    let day = Day2()
    
    @Test func part1() {
        let input: Input = """
        abcdef
        bababc
        abbcde
        abcccd
        aabcdd
        abcdee
        ababab
        """
        #expect(day.part1Solution(for: input) == "12")
    }
    
    @Test func part2() {
        let input: Input = """
        abcde
        fghij
        klmno
        pqrst
        fguij
        axcye
        wvxyz
        """
        #expect(day.part2Solution(for: input) == "fgij")
    }
}
