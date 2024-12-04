import Testing
@testable import AdventOfCode2021

struct Day12Tests {
    let day = Day12()
    
    let example1: Input = """
        start-A
        start-b
        A-c
        A-b
        b-d
        A-end
        b-end
        """
    
    let example2: Input = """
        dc-end
        HN-start
        start-kj
        dc-start
        dc-HN
        LN-dc
        HN-end
        kj-sa
        kj-HN
        kj-dc
        """
    
    let example3: Input = """
        fs-end
        he-DX
        fs-he
        start-DX
        pj-DX
        end-zg
        zg-sl
        zg-pj
        pj-he
        RW-he
        fs-DX
        pj-RW
        zg-RW
        start-pj
        he-WI
        zg-he
        pj-fs
        start-RW
        """
    
    @Test func part1() {
        #expect(day.part1Solution(for: example1) == "10")
        #expect(day.part1Solution(for: example2) == "19")
        #expect(day.part1Solution(for: example3) == "226")
        
        #expect(day.part1Solution() == "3679")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: example1) == "36")
        #expect(day.part2Solution(for: example2) == "103")
        #expect(day.part2Solution(for: example3) == "3509")
        
        #expect(day.part2Solution() == "107395")
    }
}
