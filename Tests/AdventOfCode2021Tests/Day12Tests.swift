import XCTest
@testable import AdventOfCode2021

final class Day12Tests: XCTestCase {
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
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: example1), "10")
        XCTAssertEqual(day.part1Solution(for: example2), "19")
        XCTAssertEqual(day.part1Solution(for: example3), "226")
        
        XCTAssertEqual(day.part1Solution(), "3679")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: example1), "36")
        XCTAssertEqual(day.part2Solution(for: example2), "103")
        XCTAssertEqual(day.part2Solution(for: example3), "3509")
        
        XCTAssertEqual(day.part2Solution(), "107395")
    }
}
