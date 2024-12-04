import Testing
@testable import Utilities

struct GridLineTests {
    @Test func isVertical() {
        #expect(GridLine(point: Point(x: 3, y: 7), heading: .north, amount: 2).isVertical == true)
        #expect(GridLine(point: Point(x: 2, y: 1), heading: .south, amount: 2).isVertical == true)
        
        #expect(GridLine(point: Point(x: 3, y: 7), heading: .west, amount: 2).isVertical == false)
        #expect(GridLine(point: Point(x: 2, y: 1), heading: .east, amount: 2).isVertical == false)
    }
    
    @Test func isHorizontal() {
        #expect(GridLine(point: Point(x: 3, y: 7), heading: .west, amount: 2).isHorizontal == true)
        #expect(GridLine(point: Point(x: 2, y: 1), heading: .east, amount: 2).isHorizontal == true)
        
        #expect(GridLine(point: Point(x: 3, y: 7), heading: .north, amount: 2).isHorizontal == false)
        #expect(GridLine(point: Point(x: 2, y: 1), heading: .south, amount: 2).isHorizontal == false)
    }
    
    @Test func isDiagonal() {
        #expect(GridLine(start: Point(x: 3, y: 7), end: Point(x: 7, y: 3)).isDiagonal == true)
        #expect(GridLine(start: Point(x: 1, y: 1), end: Point(x: 3, y: 3)).isDiagonal == true)
        
        #expect(GridLine(start: Point(x: 0, y: 0), end: Point(x: 0, y: 1)).isDiagonal == false)
        #expect(GridLine(start: Point(x: 1, y: 2), end: Point(x: 0, y: 10)).isDiagonal == false)
    }
    
    @Test func length() {
        let length = 15
        let line = GridLine(point: Point(x: 3, y: 7), heading: .north, amount: length)
        #expect(line.length == Int(length))
    }
    
    @Test func intersection() {
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
    
    private func assert(
        gridLine: GridLine,
        intersects other: GridLine,
        at point: Point,
        sourceLocation: Testing.SourceLocation = #_sourceLocation
    ) {
        #expect(
            gridLine.intersection(other) == point,
            sourceLocation: sourceLocation
        )
        #expect(
            other.intersection(gridLine) == point,
            sourceLocation: sourceLocation
        )
    }
    
    @Test func points() {
        let line = GridLine(start: .init(x: 6, y: 0),
                            end: .init(x: 2, y: 4))
        #expect(line.points == [
            .init(x: 6, y: 0),
            .init(x: 5, y: 1),
            .init(x: 4, y: 2),
            .init(x: 3, y: 3),
            .init(x: 2, y: 4)
        ])
    }
}
