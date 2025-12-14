import Testing
import Utilities
@testable import AdventOfCode2025

struct Day11Tests {
    let day = Day11()
    
    
    @Test func part1() {
        let input: Input = """
        aaa: you hhh
        you: bbb ccc
        bbb: ddd eee
        ccc: ddd eee fff
        ddd: ggg
        eee: out
        fff: out
        ggg: out
        hhh: ccc fff iii
        iii: out
        """
        
        #expect(day.part1Solution(for: input) == 5)
        #expect(day.part1Solution() == 511)
    }
    
    @Test func part2() {
        let input: Input = """
        svr: aaa bbb
        aaa: fft
        fft: ccc
        bbb: tty
        tty: ccc
        ccc: ddd eee
        ddd: hub
        hub: fff
        eee: dac
        dac: fff
        fff: ggg hhh
        ggg: out
        hhh: out
        """
        
        #expect(day.part2Solution(for: input) == 2)
        #expect(day.part2Solution() == 458618114529380)
    }
}
