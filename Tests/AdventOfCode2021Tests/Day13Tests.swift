import Testing
@testable import AdventOfCode2021

struct Day13Tests {
    let day = Day13()
    
    let input: Input = """
    6,10
    0,14
    9,10
    0,3
    10,4
    4,11
    6,0
    6,12
    4,1
    0,13
    10,12
    3,4
    3,0
    8,4
    1,10
    2,14
    8,10
    9,0

    fold along y=7
    fold along x=5
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "17")
        #expect(day.part1Solution() == "724")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == """
        #####
        #   #
        #   #
        #   #
        #####
        """)
        
        #expect(day.part2Solution() == "CPJBERUL")
    }
}
