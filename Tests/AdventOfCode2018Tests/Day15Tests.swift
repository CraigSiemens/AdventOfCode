import XCTest
@testable import AdventOfCode2018

@available(OSX 10.11, *)
final class Day15Tests: XCTestCase {
    let day = Day15()
    
    func testPart1Example0() {
        let input = """
        #######
        #.G...#
        #...EG#
        #.#.#G#
        #..G#E#
        #.....#
        #######
        """
        XCTAssertEqual(day.part1Solution(for: input), "27730")
    }
    
    func testPart1Example1() {
        let input = """
        #######
        #G..#E#
        #E#E.E#
        #G.##.#
        #...#E#
        #...E.#
        #######
        """
        XCTAssertEqual(day.part1Solution(for: input), "36334")
    }
    
    func testPart1Example2() {
        let input = """
        #######
        #E..EG#
        #.#G.E#
        #E.##E#
        #G..#.#
        #..E#.#
        #######
        """
        XCTAssertEqual(day.part1Solution(for: input), "39514")
    }
    
    func testPart1Example3() {
        let input = """
        #######
        #E.G#.#
        #.#G..#
        #G.#.G#
        #G..#.#
        #...E.#
        #######
        """
        XCTAssertEqual(day.part1Solution(for: input), "27755")
    }
    
    func testPart1Example4() {
        let input = """
        #######
        #.E...#
        #.#..G#
        #.###.#
        #E#G#G#
        #...#G#
        #######
        """
        XCTAssertEqual(day.part1Solution(for: input), "28944")
    }
    
    func testPart1Example5() {
        let input = """
        #########
        #G......#
        #.E.#...#
        #..##..G#
        #...##..#
        #...#...#
        #.G...G.#
        #.....G.#
        #########
        """
        XCTAssertEqual(day.part1Solution(for: input), "18740")
    }
    
    func testPart1MoveRight() {
        let input = """
        #######
        #.E..G#
        #.#####
        #G#####
        #######
        """
        XCTAssertEqual(day.part1Solution(for: input), "10234")
    }
    
    func testPart1MoveLeft() {
        let input = """
        #####
        ###G#
        ###.#
        #.E.#
        #G###
        #####
        """
        XCTAssertEqual(day.part1Solution(for: input), "10030")
    }
    
    func testPart1Movement() {
        let input = """
        #########
        #G..G..G#
        #.......#
        #.......#
        #G..E..G#
        #.......#
        #.......#
        #G..G..G#
        #########
        """
        XCTAssertEqual(day.part1Solution(for: input), "27828")
    }
    
    func testPart1Reddit1() {
        let input = """
        ####
        ##E#
        #GG#
        ####
        """
        XCTAssertEqual(day.part1Solution(for: input), "13400")
    }
    
    func testPart1Reddit2() {
        let input = """
        #####
        #GG##
        #.###
        #..E#
        #.#G#
        #.E##
        #####
        """
        XCTAssertEqual(day.part1Solution(for: input), "13987")
    }
    
    func testPart1Reddit3() {
        let input = """
        ##########
        #.E....G.#
        #......###
        #.G......#
        ##########
        """
        XCTAssertEqual(day.part1Solution(for: input), "10325")
    }
    
    func testPart1Reddit4() {
        let input = """
        ##########
        #........#
        #......#.#
        #E....G#E#
        #......#.#
        #........#
        ##########
        """
        XCTAssertEqual(day.part1Solution(for: input), "10804")
    }

    func testPart1Reddit5() {
        let input = """
        #######
        #..E#G#
        #.....#
        #G#...#
        #######
        """
        XCTAssertEqual(day.part1Solution(for: input), "10620")
    }
    
    func testPart1Reddit6() {
        let input = """
        #########
        #......G#
        #G.G...E#
        #########
        """
        XCTAssertEqual(day.part1Solution(for: input), "16932")
    }
    
    func testPart1Reddit7() {
        let input = """
        ######
        #.G..#
        #...E#
        #E...#
        ######
        """
        XCTAssertEqual(day.part1Solution(for: input), "10234")
    }
    
    func testPart1Reddit8() {
        let input = """
        ######
        #.G..#
        ##..##
        #...E#
        #E...#
        ######
        """
        XCTAssertEqual(day.part1Solution(for: input), "10430")
    }
    
    func testPart1Reddit9() {
        let input = """
        ########
        #.E....#
        #......#
        #....G.#
        #...G..#
        #G.....#
        ########
        """
        XCTAssertEqual(day.part1Solution(for: input), "12744")
    }
    
    func testPart1Reddit10() {
        let input = """
        #################
        ##..............#
        ##........G.....#
        ####.....G....###
        #....##......####
        #...............#
        ##........GG....#
        ##.........E..#.#
        #####.###...#####
        #################
        """
        XCTAssertEqual(day.part1Solution(for: input), "14740")
    }
    
    func testPart2Example1() {
        let input = """
        #######
        #.G...#
        #...EG#
        #.#.#G#
        #..G#E#
        #.....#
        #######
        """
        XCTAssertEqual(day.part2Solution(for: input), "4988")
    }
    
    func testPart2Example2() {
        let input = """
        #######
        #E..EG#
        #.#G.E#
        #E.##E#
        #G..#.#
        #..E#.#
        #######
        """
        XCTAssertEqual(day.part2Solution(for: input), "31284")
    }
    
    func testPart2Example3() {
        let input = """
        #######
        #E.G#.#
        #.#G..#
        #G.#.G#
        #G..#.#
        #...E.#
        #######
        """
        XCTAssertEqual(day.part2Solution(for: input), "3478")
    }
    
    func testPart2Example4() {
        let input = """
        #######
        #.E...#
        #.#..G#
        #.###.#
        #E#G#G#
        #...#G#
        #######
        """
        XCTAssertEqual(day.part2Solution(for: input), "6474")
    }
    
    func testPart2Example5() {
        let input = """
        #########
        #G......#
        #.E.#...#
        #..##..G#
        #...##..#
        #...#...#
        #.G...G.#
        #.....G.#
        #########
        """
        XCTAssertEqual(day.part2Solution(for: input), "1140")
    }
}
