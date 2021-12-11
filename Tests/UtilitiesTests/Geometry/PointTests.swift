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
        let neighbours = Point(x: 7, y: -2).cardinalNeighbours
        
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
    
    func testNormalized() {
        XCTAssertEqual(Point(x: 4, y: 2).normalized, Point(x: 2, y: 1))
        XCTAssertEqual(Point(x: 9, y: 0).normalized, Point(x: 1, y: 0))
    }
    
    func testAngleTo() {
        XCTAssertEqual(Point(x: 1, y: 2).angle(to: Point(x: 7, y: 6)),
                       Point(x: 3, y: 2))

        XCTAssertEqual(Point(x: 7, y: 6).angle(to: Point(x: 1, y: 2)),
                       Point(x: -3, y: -2))
    }
    
    func testAngle() {
        XCTAssertEqual(Point(x: 0, y: -1).angle, Double.pi / -2)
        XCTAssertEqual(Point(x: 1, y: 0).angle, 0)
        XCTAssertEqual(Point(x: 0, y: 1).angle, Double.pi / 2)
        XCTAssertEqual(Point(x: -1, y: 0).angle, Double.pi)
    }
}
