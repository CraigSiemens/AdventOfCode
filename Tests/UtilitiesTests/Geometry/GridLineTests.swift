import XCTest
@testable import Utilities

final class GridLineTests: XCTestCase {
    func testIsVertical() {
        XCTAssertTrue(GridLine(point: Point(x: 3, y: 7), heading: .north, amount: 2).isVertical)
        XCTAssertTrue(GridLine(point: Point(x: 2, y: 1), heading: .south, amount: 2).isVertical)
        
        XCTAssertFalse(GridLine(point: Point(x: 3, y: 7), heading: .west, amount: 2).isVertical)
        XCTAssertFalse(GridLine(point: Point(x: 2, y: 1), heading: .east, amount: 2).isVertical)
    }
    
    func testIsHorizontal() {
        XCTAssertTrue(GridLine(point: Point(x: 3, y: 7), heading: .west, amount: 2).isHorizontal)
        XCTAssertTrue(GridLine(point: Point(x: 2, y: 1), heading: .east, amount: 2).isHorizontal)
        
        XCTAssertFalse(GridLine(point: Point(x: 3, y: 7), heading: .north, amount: 2).isHorizontal)
        XCTAssertFalse(GridLine(point: Point(x: 2, y: 1), heading: .south, amount: 2).isHorizontal)
    }
    
    func testIsDiagonal() {
        XCTAssertTrue(GridLine(start: Point(x: 3, y: 7), end: Point(x: 7, y: 3)).isDiagonal)
        XCTAssertTrue(GridLine(start: Point(x: 1, y: 1), end: Point(x: 3, y: 3)).isDiagonal)
        
        XCTAssertFalse(GridLine(start: Point(x: 0, y: 0), end: Point(x: 0, y: 1)).isDiagonal)
        XCTAssertFalse(GridLine(start: Point(x: 1, y: 2), end: Point(x: 0, y: 10)).isDiagonal)
    }
    
    func testLength() {
        let length = 15
        let line = GridLine(point: Point(x: 3, y: 7), heading: .north, amount: length)
        XCTAssertEqual(line.length, Int(length))
    }
    
    func testIntersection() {
        assert(gridLine: GridLine(point: Point(x: 0, y: 0), heading: .north, amount: 2),
               intersects: GridLine(point: Point(x: 1, y: -1), heading: .west, amount: 2),
               at: Point(x: 0, y: -1))
        
        assert(gridLine: GridLine(point: Point(x: 8, y: -5), heading: .west, amount: 5),
               intersects: GridLine(point: Point(x: 6, y: -7), heading: .south, amount: 4),
               at: Point(x: 6, y: -5))
        
        assert(gridLine: GridLine(point: Point(x: 3, y: -5), heading: .south, amount: 3),
               intersects: GridLine(point: Point(x: 6, y: -3), heading: .west, amount: 4),
               at: Point(x: 3, y: -3))
    }
    
    private func assert(gridLine: GridLine, intersects other: GridLine, at point: Point, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(gridLine.intersection(other), point, file: file, line: line)
        XCTAssertEqual(other.intersection(gridLine), point, file: file, line: line)
    }
    
    func testPoints() {
        let line = GridLine(start: .init(x: 6, y: 0),
                            end: .init(x: 2, y: 4))
        XCTAssertEqual(line.points, [
            .init(x: 6, y: 0),
            .init(x: 5, y: 1),
            .init(x: 4, y: 2),
            .init(x: 3, y: 3),
            .init(x: 2, y: 4)
        ])
    }
}
