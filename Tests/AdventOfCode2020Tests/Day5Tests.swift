import Testing
@testable import AdventOfCode2020

struct Day5Tests {
    let day = Day5()
    
    @Test func seatID() {
        #expect(day.seatID(for: "FBFBBFFRLR") == 357)
        #expect(day.seatID(for: "BFFFBBFRRR") == 567)
        #expect(day.seatID(for: "FFFBBBFRRR") == 119)
        #expect(day.seatID(for: "BBFFBBFRLL") == 820)
    }
    
    @Test func part1() {
        let input: Input = """
        FBFBBFFRLR
        BFFFBBFRRR
        FFFBBBFRRR
        BBFFBBFRLL
        """
        
        #expect(day.part1Solution(for: input) == "820")
    }
    
    @Test func part2() {
        let input: Input = """
        FFFFFFFLLL
        FFFFFFFLLR
        FFFFFFFLRL
        FFFFFFFRLL
        """
        
        #expect(day.part2Solution(for: input) == "3")
    }
}
