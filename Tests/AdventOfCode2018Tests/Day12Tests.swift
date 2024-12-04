import Testing
@testable import AdventOfCode2018

struct Day12Tests {
    let day = Day12()
    
    let input: Input = """
    initial state: #..#.#..##......###...###

    ...## => #
    ..#.. => #
    .#... => #
    .#.#. => #
    .#.## => #
    .##.. => #
    .#### => #
    #.#.# => #
    #.### => #
    ##.#. => #
    ##.## => #
    ###.. => #
    ###.# => #
    ####. => #
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "325")
        #expect(day.part1Solution() == "3472")
    }
    
    @Test func part2() {
        #expect(day.part2Solution() == "2600000000919")
    }
}
