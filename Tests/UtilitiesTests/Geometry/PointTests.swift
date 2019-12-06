import XCTest
@testable import Utilities

final class PointTests: XCTestCase {
    func testMoved() {
        XCTAssertEqual(Point(x: 0, y: 0).moved(.north),
                       Point(x: 0, y: -1))
        XCTAssertEqual(Point(x: 0, y: 0).moved(.south),
                       Point(x: 0, y: 1))
        XCTAssertEqual(Point(x: 0, y: 0).moved(.east),
                       Point(x: 1, y: 0))
        XCTAssertEqual(Point(x: 0, y: 0).moved(.west),
                       Point(x: -1, y: 0))
    }
    
    func testNeighnours() {
        let neighbours = Point(x: 7, y: -2).neighbours
        
        XCTAssertTrue(neighbours.contains(Point(x: 6, y: -2)))
        XCTAssertTrue(neighbours.contains(Point(x: 8, y: -2)))
        XCTAssertTrue(neighbours.contains(Point(x: 7, y: -1)))
        XCTAssertTrue(neighbours.contains(Point(x: 7, y: -3)))
    }
    
    func testManhattanDistance() {
        let distance = Point(x: 5, y: 2)
            .manhattanDistance(to: Point(x: -3, y: 7))
        XCTAssertEqual(distance, 13)
    }
    
    func testArea() {
        let area = Point(x: 5, y: 2)
            .area(with: Point(x: -3, y: 7))
        XCTAssertEqual(area, 40)
    }
}
