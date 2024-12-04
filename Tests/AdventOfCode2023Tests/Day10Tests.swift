import Testing
import Utilities
@testable import AdventOfCode2023

struct Day10Tests {
    let day = Day10()
    
    @Test func part1() {
        let input1: Input = """
        -L|F7
        7S-7|
        L|7||
        -L-J|
        L|-JF
        """
        #expect(day.part1Solution(for: input1) == 4)
        
        let input2: Input = """
        7-F7-
        .FJ|7
        SJLL7
        |F--J
        LJ.LJ
        """
        #expect(day.part1Solution(for: input2) == 8)
        
        #expect(day.part1Solution() == 6923)
    }
    
    @Test func part2() {
        let input1: Input = """
        .F----7F7F7F7F-7....
        .|F--7||||||||FJ....
        .||.FJ||||||||L7....
        FJL7L7LJLJ||LJ.L-7..
        L--J.L7...LJS7F-7L7.
        ....F-J..F7FJ|L7L7L7
        ....L7.F7||L7|.L7L7|
        .....|FJLJ|FJ|F7|.LJ
        ....FJL-7.||.||||...
        ....L---J.LJ.LJLJ...
        """
        #expect(day.part2Solution(for: input1) == 8)
        
        let input2: Input = """
        FF7FSF7F7F7F7F7F---7
        L|LJ||||||||||||F--J
        FL-7LJLJ||||||LJL-77
        F--JF--7||LJLJ7F7FJ-
        L---JF-JLJ.||-FJLJJ7
        |F|F-JF---7F7-L7L|7|
        |FFJF7L7F-JF7|JL---7
        7-L-JL7||F7|L7F-7F7|
        L.L7LFJ|||||FJL7||LJ
        L7JLJL-JLJLJL--JLJ.L
        """
        #expect(day.part2Solution(for: input2) == 10)
        
        #expect(day.part2BSolution(for: input1) == 8)
        #expect(day.part2BSolution(for: input2) == 10)
        #expect(day.part2BSolution(for: type(of: day).input) == 529)
    }
    
    @Test func part2B() {
        let input1: Input = """
        .F----7F7F7F7F-7....
        .|F--7||||||||FJ....
        .||.FJ||||||||L7....
        FJL7L7LJLJ||LJ.L-7..
        L--J.L7...LJS7F-7L7.
        ....F-J..F7FJ|L7L7L7
        ....L7.F7||L7|.L7L7|
        .....|FJLJ|FJ|F7|.LJ
        ....FJL-7.||.||||...
        ....L---J.LJ.LJLJ...
        """
        #expect(day.part2BSolution(for: input1) == 8)
        
        let input2: Input = """
        FF7FSF7F7F7F7F7F---7
        L|LJ||||||||||||F--J
        FL-7LJLJ||||||LJL-77
        F--JF--7||LJLJ7F7FJ-
        L---JF-JLJ.||-FJLJJ7
        |F|F-JF---7F7-L7L|7|
        |FFJF7L7F-JF7|JL---7
        7-L-JL7||F7|L7F-7F7|
        L.L7LFJ|||||FJL7||LJ
        L7JLJL-JLJLJL--JLJ.L
        """
        #expect(day.part2BSolution(for: input2) == 10)
        
        #expect(day.part2BSolution(for: type(of: day).input) == 529)
    }
}
