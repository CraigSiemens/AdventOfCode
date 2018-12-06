import Foundation

struct Coordinate: Hashable {
    var x, y: Int
    
    func neighbour(going direction: Direction) -> Coordinate {
        switch direction {
        case .up: return Coordinate(x: x, y: y-1)
        case .down: return Coordinate(x: x, y: y+1)
        case .left: return Coordinate(x: x-1, y: y)
        case .right: return Coordinate(x: x+1, y: y)
        }
    }
    
    var neighbours: [Coordinate] {
        return Direction.allCases.map(neighbour(going: ))
    }
    
    func manhattanDistance(to other: Coordinate) -> Int {
        return abs(x - other.x) + abs(y - other.y)
    }
}

enum Direction: CaseIterable {
    case up, down, left, right
}
