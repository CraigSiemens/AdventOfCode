import XCTest
@testable import AdventOfCode2021

final class Day13Tests: XCTestCase {
    let day = Day13()
    
    let input: Input = """
    6,10
    0,14
    9,10
    0,3
    10,4
    4,11
    6,0
    6,12
    4,1
    0,13
    10,12
    3,4
    3,0
    8,4
    1,10
    2,14
    8,10
    9,0

    fold along y=7
    fold along x=5
    """
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(for: input), "17")
        XCTAssertEqual(day.part1Solution(), "724")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), """
        #####
        #   #
        #   #
        #   #
        #####
        """)
        
        XCTAssertEqual(day.part2Solution(), """
         ##  ###    ## ###  #### ###  #  # #
        #  # #  #    # #  # #    #  # #  # #
        #    #  #    # ###  ###  #  # #  # #
        #    ###     # #  # #    ###  #  # #
        #  # #    #  # #  # #    # #  #  # #
         ##  #     ##  ###  #### #  #  ##  ####
        """)
    }
}
