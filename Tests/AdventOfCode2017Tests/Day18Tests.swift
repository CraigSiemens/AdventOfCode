import Testing
@testable import AdventOfCode2017

struct Day18Tests {
    let day = Day18()
    
    @Test func part1() {
        let input: Input = """
            set a 1
            add a 2
            mul a a
            mod a 5
            snd a
            set a 0
            rcv a
            jgz a -1
            set a 1
            jgz a -2
            """
        #expect(day.part1Solution(for: input) == "4")
        
        #expect(day.part1Solution() == "8600")
    }
    
    @Test func part2() {
        let input: Input = """
            snd 1
            snd 2
            snd p
            rcv a
            rcv b
            rcv c
            rcv d
            """
        #expect(day.part2Solution(for: input) == "3")

        #expect(day.part2Solution() == "7239")
    }
}
