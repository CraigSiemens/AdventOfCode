import Foundation

public struct Point: Hashable {
    public var x, y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public func moved(_ direction: Direction) -> Point {
        switch direction {
        case .up: return Point(x: x, y: y-1)
        case .down: return Point(x: x, y: y+1)
        case .left: return Point(x: x-1, y: y)
        case .right: return Point(x: x+1, y: y)
        }
    }
    
    public var neighbours: [Point] {
        return Direction.allCases.map(moved(_: ))
    }
    
    public func manhattanDistance(to other: Point) -> Int {
        return abs(x - other.x) + abs(y - other.y)
    }
    
    public func area(with other: Point) -> Int {
        return abs(x - other.x) * abs(y - other.y)
    }
}

extension Point {
    public static func + (lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x + rhs.x,
                     y: lhs.y + rhs.y)
    }
    
    public static func += (lhs: inout Point, rhs: Point) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }
}

public enum Direction: CaseIterable {
    case up, down, left, right
}

extension Collection where Element == Point {
    public func extremes() -> (min: Point, max: Point) {
        var min = Point(x: .max, y: .max)
        var max = Point(x: .min, y: .min)
        
        forEach { (p) in
            min.x = Swift.min(min.x, p.x)
            min.y = Swift.min(min.y, p.y)
            max.x = Swift.max(max.x, p.x)
            max.y = Swift.max(max.y, p.y)
        }
        
        return (min, max)
    }
}
