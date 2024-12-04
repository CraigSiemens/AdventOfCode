import Testing
import Utilities
@testable import AdventOfCode2022

struct Day7Tests {
    let day = Day7()
    
    let input: Input = """
    $ cd /
    $ ls
    dir a
    14848514 b.txt
    8504156 c.dat
    dir d
    $ cd a
    $ ls
    dir e
    29116 f
    2557 g
    62596 h.lst
    $ cd e
    $ ls
    584 i
    $ cd ..
    $ cd ..
    $ cd d
    $ ls
    4060174 j
    8033020 d.log
    5626152 d.ext
    7214296 k
    """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == 95437)
        #expect(day.part1Solution() == 1886043)
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: input) == 24933642)
        #expect(day.part2Solution() == 3842121)
    }
}
