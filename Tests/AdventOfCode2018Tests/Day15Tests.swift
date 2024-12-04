import Testing
@testable import AdventOfCode2018

struct Day15Tests {
    let day = Day15()
    
    @Test func part1Example0() {
        let input: Input = """
        #######
        #.G...#
        #...EG#
        #.#.#G#
        #..G#E#
        #.....#
        #######
        """
        #expect(day.part1Solution(for: input) == "27730")
    }
    
    @Test func part1Example1() {
        let input: Input = """
        #######
        #G..#E#
        #E#E.E#
        #G.##.#
        #...#E#
        #...E.#
        #######
        """
        #expect(day.part1Solution(for: input) == "36334")
    }
    
    @Test func part1Example2() {
        let input: Input = """
        #######
        #E..EG#
        #.#G.E#
        #E.##E#
        #G..#.#
        #..E#.#
        #######
        """
        #expect(day.part1Solution(for: input) == "39514")
    }
    
    @Test func part1Example3() {
        let input: Input = """
        #######
        #E.G#.#
        #.#G..#
        #G.#.G#
        #G..#.#
        #...E.#
        #######
        """
        #expect(day.part1Solution(for: input) == "27755")
    }
    
    @Test func part1Example4() {
        let input: Input = """
        #######
        #.E...#
        #.#..G#
        #.###.#
        #E#G#G#
        #...#G#
        #######
        """
        #expect(day.part1Solution(for: input) == "28944")
    }
    
    @Test func part1Example5() {
        let input: Input = """
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
        #expect(day.part1Solution(for: input) == "18740")
    }
    
    @Test func part1MoveRight() {
        let input: Input = """
        #######
        #.E..G#
        #.#####
        #G#####
        #######
        """
        #expect(day.part1Solution(for: input) == "10234")
    }
    
    @Test func part1MoveLeft() {
        let input: Input = """
        #####
        ###G#
        ###.#
        #.E.#
        #G###
        #####
        """
        #expect(day.part1Solution(for: input) == "10030")
    }
    
    @Test func part1Movement() {
        let input: Input = """
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
        #expect(day.part1Solution(for: input) == "27828")
    }
    
    @Test func part1Reddit1() {
        let input: Input = """
        ####
        ##E#
        #GG#
        ####
        """
        #expect(day.part1Solution(for: input) == "13400")
    }
    
    @Test func part1Reddit2() {
        let input: Input = """
        #####
        #GG##
        #.###
        #..E#
        #.#G#
        #.E##
        #####
        """
        #expect(day.part1Solution(for: input) == "13987")
    }
    
    @Test func part1Reddit3() {
        let input: Input = """
        ##########
        #.E....G.#
        #......###
        #.G......#
        ##########
        """
        #expect(day.part1Solution(for: input) == "10325")
    }
    
    @Test func part1Reddit4() {
        let input: Input = """
        ##########
        #........#
        #......#.#
        #E....G#E#
        #......#.#
        #........#
        ##########
        """
        #expect(day.part1Solution(for: input) == "10804")
    }

    @Test func part1Reddit5() {
        let input: Input = """
        #######
        #..E#G#
        #.....#
        #G#...#
        #######
        """
        #expect(day.part1Solution(for: input) == "10620")
    }
    
    @Test func part1Reddit6() {
        let input: Input = """
        #########
        #......G#
        #G.G...E#
        #########
        """
        #expect(day.part1Solution(for: input) == "16932")
    }
    
    @Test func part1Reddit7() {
        let input: Input = """
        ######
        #.G..#
        #...E#
        #E...#
        ######
        """
        #expect(day.part1Solution(for: input) == "10234")
    }
    
    @Test func part1Reddit8() {
        let input: Input = """
        ######
        #.G..#
        ##..##
        #...E#
        #E...#
        ######
        """
        #expect(day.part1Solution(for: input) == "10430")
    }
    
    @Test func part1Reddit9() {
        let input: Input = """
        ########
        #.E....#
        #......#
        #....G.#
        #...G..#
        #G.....#
        ########
        """
        #expect(day.part1Solution(for: input) == "12744")
    }
    
    @Test func part1Reddit10() {
        let input: Input = """
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
        #expect(day.part1Solution(for: input) == "14740")
    }
    
    @Test func part2Example1() {
        let input: Input = """
        #######
        #.G...#
        #...EG#
        #.#.#G#
        #..G#E#
        #.....#
        #######
        """
        #expect(day.part2Solution(for: input) == "4988")
    }
    
    @Test func part2Example2() {
        let input: Input = """
        #######
        #E..EG#
        #.#G.E#
        #E.##E#
        #G..#.#
        #..E#.#
        #######
        """
        #expect(day.part2Solution(for: input) == "31284")
    }
    
    @Test func part2Example3() {
        let input: Input = """
        #######
        #E.G#.#
        #.#G..#
        #G.#.G#
        #G..#.#
        #...E.#
        #######
        """
        #expect(day.part2Solution(for: input) == "3478")
    }
    
    @Test func part2Example4() {
        let input: Input = """
        #######
        #.E...#
        #.#..G#
        #.###.#
        #E#G#G#
        #...#G#
        #######
        """
        #expect(day.part2Solution(for: input) == "6474")
    }
    
    @Test func part2Example5() {
        let input: Input = """
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
        #expect(day.part2Solution(for: input) == "1140")
    }
}
