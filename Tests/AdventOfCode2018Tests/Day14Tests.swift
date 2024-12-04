import Testing
@testable import AdventOfCode2018

struct Day14Tests {
    let day = Day14()
    
//    let input: Input = """
//    <#input#>
//    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: "9") == "5158916779")
        #expect(day.part1Solution(for: "5") == "0124515891")
        #expect(day.part1Solution(for: "18") == "9251071085")
        #expect(day.part1Solution(for: "2018") == "5941429882")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: "51589") == "9")
        #expect(day.part2Solution(for: "01245") == "5")
        #expect(day.part2Solution(for: "92510") == "18")
        #expect(day.part2Solution(for: "59414") == "2018")
    }
}
