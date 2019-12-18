import XCTest
@testable import AdventOfCode2019

final class Day12Tests: XCTestCase {
    let day = Day12()
    
    let input = """
        <x=-1, y=0, z=2>
        <x=2, y=-10, z=-7>
        <x=4, y=-8, z=8>
        <x=3, y=5, z=-1>
        """
    
    func testRunSimulation() {
        let steps = [
            [
                Day12.Planet(position: .init(x:-1, y:  0, z: 2), velocity: .init(x: 0, y: 0, z: 0)),
                Day12.Planet(position: .init(x: 2, y:-10, z:-7), velocity: .init(x: 0, y: 0, z: 0)),
                Day12.Planet(position: .init(x: 4, y: -8, z: 8), velocity: .init(x: 0, y: 0, z: 0)),
                Day12.Planet(position: .init(x: 3, y:  5, z:-1), velocity: .init(x: 0, y: 0, z: 0)),
            ],
            [
                Day12.Planet(position: .init(x: 2, y:-1, z: 1), velocity: .init(x: 3, y:-1, z:-1)),
                Day12.Planet(position: .init(x: 3, y:-7, z:-4), velocity: .init(x: 1, y: 3, z: 3)),
                Day12.Planet(position: .init(x: 1, y:-7, z: 5), velocity: .init(x:-3, y: 1, z:-3)),
                Day12.Planet(position: .init(x: 2, y: 2, z: 0), velocity: .init(x:-1, y:-3, z: 1)),
            ],
            //        After 2 steps:
            [
                Day12.Planet(position: .init(x: 5, y:-3, z:-1), velocity: .init(x: 3, y:-2, z:-2)),
                Day12.Planet(position: .init(x: 1, y:-2, z: 2), velocity: .init(x:-2, y: 5, z: 6)),
                Day12.Planet(position: .init(x: 1, y:-4, z:-1), velocity: .init(x: 0, y: 3, z:-6)),
                Day12.Planet(position: .init(x: 1, y:-4, z: 2), velocity: .init(x:-1, y:-6, z: 2)),
            ],
            //        After 3 steps:
            [
                Day12.Planet(position: .init(x: 5, y:-6, z:-1), velocity: .init(x: 0, y:-3, z: 0)),
                Day12.Planet(position: .init(x: 0, y: 0, z: 6), velocity: .init(x:-1, y: 2, z: 4)),
                Day12.Planet(position: .init(x: 2, y: 1, z:-5), velocity: .init(x: 1, y: 5, z:-4)),
                Day12.Planet(position: .init(x: 1, y:-8, z: 2), velocity: .init(x: 0, y:-4, z: 0)),
            ],
            //        After 4 steps:
            [
                Day12.Planet(position: .init(x: 2, y:-8, z: 0), velocity: .init(x:-3, y:-2, z: 1)),
                Day12.Planet(position: .init(x: 2, y: 1, z: 7), velocity: .init(x: 2, y: 1, z: 1)),
                Day12.Planet(position: .init(x: 2, y: 3, z:-6), velocity: .init(x: 0, y: 2, z:-1)),
                Day12.Planet(position: .init(x: 2, y:-9, z: 1), velocity: .init(x: 1, y:-1, z:-1)),
            ],
            //        After 5 steps:
            [
                Day12.Planet(position: .init(x:-1, y:-9, z: 2), velocity: .init(x:-3, y:-1, z: 2)),
                Day12.Planet(position: .init(x: 4, y: 1, z: 5), velocity: .init(x: 2, y: 0, z:-2)),
                Day12.Planet(position: .init(x: 2, y: 2, z:-4), velocity: .init(x: 0, y:-1, z: 2)),
                Day12.Planet(position: .init(x: 3, y:-7, z:-1), velocity: .init(x: 1, y: 2, z:-2)),
            ],
            //        After 6 steps:
            [
                Day12.Planet(position: .init(x:-1, y:-7, z: 3), velocity: .init(x: 0, y: 2, z: 1)),
                Day12.Planet(position: .init(x: 3, y: 0, z: 0), velocity: .init(x:-1, y:-1, z:-5)),
                Day12.Planet(position: .init(x: 3, y:-2, z: 1), velocity: .init(x: 1, y:-4, z: 5)),
                Day12.Planet(position: .init(x: 3, y:-4, z:-2), velocity: .init(x: 0, y: 3, z:-1)),
            ],
            [
                Day12.Planet(position: .init(x: 2, y:-2, z: 1), velocity: .init(x: 3, y: 5, z:-2)),
                Day12.Planet(position: .init(x: 1, y:-4, z:-4), velocity: .init(x:-2, y:-4, z:-4)),
                Day12.Planet(position: .init(x: 3, y:-7, z: 5), velocity: .init(x: 0, y:-5, z: 4)),
                Day12.Planet(position: .init(x: 2, y: 0, z: 0), velocity: .init(x:-1, y: 4, z: 2)),
            ],
            [
                Day12.Planet(position: .init(x: 5, y: 2, z:-2), velocity: .init(x: 3, y: 4, z:-3)),
                Day12.Planet(position: .init(x: 2, y:-7, z:-5), velocity: .init(x: 1, y:-3, z:-1)),
                Day12.Planet(position: .init(x: 0, y:-9, z: 6), velocity: .init(x:-3, y:-2, z: 1)),
                Day12.Planet(position: .init(x: 1, y: 1, z: 3), velocity: .init(x:-1, y: 1, z: 3)),
            ],
            [
                Day12.Planet(position: .init(x: 5, y: 3, z:-4), velocity: .init(x: 0, y: 1, z:-2)),
                Day12.Planet(position: .init(x: 2, y:-9, z:-3), velocity: .init(x: 0, y:-2, z: 2)),
                Day12.Planet(position: .init(x: 0, y:-8, z: 4), velocity: .init(x: 0, y: 1, z:-2)),
                Day12.Planet(position: .init(x: 1, y: 1, z: 5), velocity: .init(x: 0, y: 0, z: 2)),
            ],
            [
                Day12.Planet(position: .init(x: 2, y: 1, z:-3), velocity: .init(x:-3, y:-2, z: 1)),
                Day12.Planet(position: .init(x: 1, y:-8, z: 0), velocity: .init(x:-1, y: 1, z: 3)),
                Day12.Planet(position: .init(x: 3, y:-6, z: 1), velocity: .init(x: 3, y: 2, z:-3)),
                Day12.Planet(position: .init(x: 2, y: 0, z: 4), velocity: .init(x: 1, y:-1, z:-1)),
            ]
        ]
        
        var planets = day.parse(input: input)
        XCTAssertEqual(planets, steps[0])
        
        planets = day.runSimulation(planets: planets, steps: 1)
        XCTAssertEqual(planets, steps[1])
        
        planets = day.runSimulation(planets: planets, steps: 1)
        XCTAssertEqual(planets, steps[2])
        
        planets = day.runSimulation(planets: planets, steps: 1)
        XCTAssertEqual(planets, steps[3])
        
        planets = day.runSimulation(planets: planets, steps: 1)
        XCTAssertEqual(planets, steps[4])
        
        planets = day.runSimulation(planets: planets, steps: 1)
        XCTAssertEqual(planets, steps[5])
        
        planets = day.runSimulation(planets: planets, steps: 1)
        XCTAssertEqual(planets, steps[6])
        
        planets = day.runSimulation(planets: planets, steps: 1)
        XCTAssertEqual(planets, steps[7])
        
        planets = day.runSimulation(planets: planets, steps: 1)
        XCTAssertEqual(planets, steps[8])
        
        planets = day.runSimulation(planets: planets, steps: 1)
        XCTAssertEqual(planets, steps[9])
        
        planets = day.runSimulation(planets: planets, steps: 1)
        XCTAssertEqual(planets, steps[10])
    }
    
    func testPart1() {
        XCTAssertEqual(day.part1Solution(), "7988")
    }
    
    func testPart2() {
        XCTAssertEqual(day.part2Solution(for: input), "2772")
    }
    
    func testLongPart2() {
        let input = """
            <x=-8, y=-10, z=0>
            <x=5, y=5, z=10>
            <x=2, y=-7, z=3>
            <x=9, y=-8, z=-3>
            """
        
        XCTAssertEqual(day.part2Solution(for: input), "4686774924")
    }
}
