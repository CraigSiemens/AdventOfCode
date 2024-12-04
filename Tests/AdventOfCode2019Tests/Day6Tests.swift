import Testing
@testable import AdventOfCode2019

struct Day6Tests {
    let day = Day6()
    
//    let input: Input = """
//    <#input#>
//    """
    
    @Test func part1() {
        let input: Input = """
            COM)B
            B)C
            C)D
            D)E
            E)F
            B)G
            G)H
            D)I
            E)J
            J)K
            K)L
            """
        #expect(day.part1Solution(for: input) == "42")
    }
    
    @Test func part2() {
        let input: Input = """
            COM)B
            B)C
            C)D
            D)E
            E)F
            B)G
            G)H
            D)I
            E)J
            J)K
            K)L
            K)YOU
            I)SAN
            """
        #expect(day.part2Solution(for: input) == "4")
    }
}
