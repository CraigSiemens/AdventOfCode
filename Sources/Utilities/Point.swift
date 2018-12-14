import Foundation

public struct Point: Hashable {
    public var x, y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public func moved(_ heading: Heading) -> Point {
        switch heading {
        case .north: return Point(x: x, y: y-1)
        case .south: return Point(x: x, y: y+1)
        case .west: return Point(x: x-1, y: y)
        case .east: return Point(x: x+1, y: y)
        }
    }
    
    public var neighbours: [Point] {
        return Heading.allCases.map(moved(_: ))
    }
    
    public func manhattanDistance(to other: Point) -> Int {
        return abs(x - other.x) + abs(y - other.y)
    }
    
    public func area(with other: Point) -> Int {
        return abs(x - other.x) * abs(y - other.y)
    }
}

extension Point {
    public static func all(in xRange: ClosedRange<Int>, _ yRange: ClosedRange<Int>) -> [Point] {
        return yRange.flatMap { y -> [Point] in
            return xRange.map { Point(x: $0, y: y) }
        }
    }
    
    public static func + (lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x + rhs.x,
                     y: lhs.y + rhs.y)
    }
    
    public static func += (lhs: inout Point, rhs: Point) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }
}

extension Point: Comparable {
    public static func < (lhs: Point, rhs: Point) -> Bool {
        return lhs.y < rhs.y || (lhs.y == rhs.y &&  lhs.x < rhs.x)
    }
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
