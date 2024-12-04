import Testing
@testable import Utilities

struct PointTests {
    @Test func moved() {
        #expect(Point(x: 0, y: 0).moved(.north) == Point(x: 0, y: -1))
        #expect(Point(x: 0, y: 0).moved(.south) == Point(x: 0, y: 1))
        #expect(Point(x: 0, y: 0).moved(.east) == Point(x: 1, y: 0))
        #expect(Point(x: 0, y: 0).moved(.west) == Point(x: -1, y: 0))
    }
    
    @Test func cardinalNeighbours() {
        let neighbours = Point(x: 7, y: -2).cardinalNeighbours
        
        #expect(neighbours.contains(Point(x: 6, y: -2)) == true)
        #expect(neighbours.contains(Point(x: 8, y: -2)) == true)
        #expect(neighbours.contains(Point(x: 7, y: -1)) == true)
        #expect(neighbours.contains(Point(x: 7, y: -3)) == true)
    }
    
    @Test func diagonalNeighbours() {
        let neighbours = Point(x: 7, y: -2).diagonalNeighbours
        
        #expect(neighbours.contains(Point(x: 6, y: -3)) == true)
        #expect(neighbours.contains(Point(x: 6, y: -1)) == true)
        #expect(neighbours.contains(Point(x: 8, y: -3)) == true)
        #expect(neighbours.contains(Point(x: 8, y: -1)) == true)
    }
    
    @Test func manhattanDistance() {
        let distance = Point(x: 5, y: 2)
            .manhattanDistance(to: Point(x: -3, y: 7))
        #expect(distance == 13)
    }
    
    @Test func area() {
        let area = Point(x: 5, y: 2)
            .area(with: Point(x: -3, y: 7))
        #expect(area == 40)
    }
    
    @Test func isCardinalNeighbour() {
        #expect(Point(x: 5, y: 2).isCardinalNeighbour(with: Point(x: 5, y: 1)) == true)
        #expect(Point(x: 5, y: 2).isCardinalNeighbour(with: Point(x: 4, y: 2)) == true)
        
        #expect(Point(x: 5, y: 2).isCardinalNeighbour(with: Point(x: 5, y: 0)) == false)
        #expect(Point(x: 5, y: 2).isCardinalNeighbour(with: Point(x: 4, y: 1)) == false)
    }
    
    @Test func isDiagonalNeighbour() {
        #expect(Point(x: 5, y: 2).isDiagonalNeighbour(with: Point(x: 4, y: 1)) == true)
        #expect(Point(x: 5, y: 2).isDiagonalNeighbour(with: Point(x: 6, y: 3)) == true)
        
        #expect(Point(x: 5, y: 2).isDiagonalNeighbour(with: Point(x: 5, y: 1)) == false)
        #expect(Point(x: 5, y: 2).isDiagonalNeighbour(with: Point(x: 3, y: 0)) == false)
    }
    
    @Test func isNeighbour() {
        #expect(Point(x: 5, y: 2).isNeighbour(with: Point(x: 5, y: 1)) == true)
        #expect(Point(x: 5, y: 2).isNeighbour(with: Point(x: 4, y: 2)) == true)
        #expect(Point(x: 5, y: 2).isNeighbour(with: Point(x: 4, y: 1)) == true)
        #expect(Point(x: 5, y: 2).isNeighbour(with: Point(x: 6, y: 3)) == true)
        
        #expect(Point(x: 5, y: 2).isNeighbour(with: Point(x: 5, y: 0)) == false)
        #expect(Point(x: 5, y: 2).isNeighbour(with: Point(x: 3, y: 0)) == false)
    }
    
    @Test func signum() {
        #expect(Point(x: 4, y: 2).signum == Point(x: 1, y: 1))
        #expect(Point(x: 9, y: 0).signum == Point(x: 1, y: 0))
        #expect(Point(x: -9, y: 4).signum == Point(x: -1, y: 1))
    }
    
    @Test func normalized() {
        #expect(Point(x: 4, y: 2).normalized == Point(x: 2, y: 1))
        #expect(Point(x: 9, y: 0).normalized == Point(x: 1, y: 0))
    }
    
    @Test func angleTo() {
        #expect(Point(x: 1, y: 2).angle(to: Point(x: 7, y: 6)) == Point(x: 3, y: 2))
        #expect(Point(x: 7, y: 6).angle(to: Point(x: 1, y: 2)) == Point(x: -3, y: -2))
    }
    
    @Test func angle() {
        #expect(Point(x: 0, y: -1).angle == Double.pi / -2)
        #expect(Point(x: 1, y: 0).angle == 0)
        #expect(Point(x: 0, y: 1).angle == Double.pi / 2)
        #expect(Point(x: -1, y: 0).angle == Double.pi)
    }
}
