import Testing
import Utilities
@testable import AdventOfCode2023

struct Day5Tests {
    let day = Day5()
    
    let input: Input = """
    seeds: 79 14 55 13
    
    seed-to-soil map:
    50 98 2
    52 50 48
    
    soil-to-fertilizer map:
    0 15 37
    37 52 2
    39 0 15
    
    fertilizer-to-water map:
    49 53 8
    0 11 42
    42 0 7
    57 7 4
    
    water-to-light map:
    88 18 7
    18 25 70
    
    light-to-temperature map:
    45 77 23
    81 45 19
    68 64 13
    
    temperature-to-humidity map:
    0 69 1
    1 0 69
    
    humidity-to-location map:
    60 56 37
    56 93 4
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 35)
        #expect(day.part1Solution() == 486613012)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 46)
        #expect(day.part2Solution() == 56931769)
    }
}
