import Testing
import Utilities
@testable import AdventOfCode2025

struct Day10Tests {
    let day = Day10()
    
    let input: Input = """
    [.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
    [...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}
    [.###.#] (0,1,2,3,4) (0,3,4) (0,1,2,4,5) (1,2) {10,11,11,5,10,5}
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 7)
        #expect(day.part1Solution() == 404)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 33)
//        #expect(day.part2Solution() == /*@START_MENU_TOKEN@*//*@PLACEHOLDER=solution@*/0/*@END_MENU_TOKEN@*/)
    }
}
