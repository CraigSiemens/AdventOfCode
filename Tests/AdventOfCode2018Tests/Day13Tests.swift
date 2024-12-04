import Testing
@testable import AdventOfCode2018

struct Day13Tests {
    let day = Day13()
    
    
    @Test func part1() {
        let input: Input = """
        /->-\\
        |   |  /----\\
        | /-+--+-\\  |
        | | |  | v  |
        \\-+-/  \\-+--/
          \\------/
        """
        
        #expect(day.part1Solution(for: input) == "7,3")
        #expect(day.part1Solution(for: "->---<-") == "3,0")
        #expect(day.part1Solution(for: "->--<-") == "3,0")
    }
    
    @Test func part2() {
        let input: Input = """
        />-<\\
        |   |
        | /<+-\\
        | | | v
        \\>+</ |
          |   ^
          \\<->/
        """
        
        #expect(day.part2Solution(for: input) == "6,4")
    }
}
