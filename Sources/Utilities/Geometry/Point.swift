import Algorithms
import Foundation

public struct Point: Hashable {
    public var x, y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public func moved(_ heading: Heading, amount: Int = 1) -> Point {
        switch heading {
        case .north: return Point(x: x, y: y-amount)
        case .south: return Point(x: x, y: y+amount)
        case .west: return Point(x: x-amount, y: y)
        case .east: return Point(x: x+amount, y: y)
        }
    }
    
    public var cardinalNeighbours: [Point] {
        return Heading.allCases.map { moved($0) }
    }
    
    public var diagonalNeighbours: [Point] {
        return [
            .init(x: x-1, y: y-1),
            .init(x: x-1, y: y+1),
            .init(x: x+1, y: y-1),
            .init(x: x+1, y: y+1)
        ]
    }

    public var allNeighbours: [Point] {
        return cardinalNeighbours + diagonalNeighbours
    }
    
    /// The total number of horizontal and vertical steps between the two points.
    public func manhattanDistance(to other: Point) -> Int {
        return abs(x - other.x) + abs(y - other.y)
    }
    
    public func area(with other: Point) -> Int {
        return abs(x - other.x) * abs(y - other.y)
    }
    
    func isCardinalNeighbour(with other: Point) -> Bool {
        manhattanDistance(to: other) == 1
    }
    
    func isDiagonalNeighbour(with other: Point) -> Bool {
        let diff = self - other
        return abs(diff.x) == 1 && abs(diff.y) == 1
    }
    
    public func isNeighbour(with other: Point) -> Bool {
        isCardinalNeighbour(with: other)
        || isDiagonalNeighbour(with: other)
    }
}

// MARK: - Angle
extension Point {
    /// A point containing the sign of the x and y values.
    public var signum: Point {
        Point(x: x.signum(), y: y.signum())
    }
    
    // The shortest representation of the point that can be represented with while numbers
    public var normalized: Point {
        let divisor = abs(x.gcd(with: y))
        guard divisor != 0 else { return .zero }
        return Point(x: x / divisor, y: y / divisor)
    }
    
    public func angle(to other: Point) -> Point {
        (other - self).normalized
    }
    
    /// The angle from the x-axis
    /// A rotation towards the + y-axis is positive
    /// A rotation towards the - y-axis is negative
    public var angle: Double {
        atan2(Double(y), Double(x))
    }
}

// MARK: - Constants
extension Point {
    public static let zero = Point(x: 0, y: 0)
}

// MARK: - SIMD2
extension Point {
    public var int2: SIMD2<Int32> {
        return SIMD2<Int32>(Int32(x), Int32(y))
    }
}

extension SIMD2 where Scalar: BinaryInteger {
    public var point: Point {
        return Point(x: Int(x), y: Int(y))
    }
}

// MARK: Arithmetic
extension Point {
    public static func all(in xRange: ClosedRange<Int>, _ yRange: ClosedRange<Int>) -> [Point] {
        return yRange.flatMap { y -> [Point] in
            return xRange.map { Point(x: $0, y: y) }
        }
    }
    
    public static func all(from: Point, to: Point) -> some Sequence<Point> {
        let step = from.angle(to: to)
        var isAtEnd = false
        
        return sequence(first: from) { point in
            guard !isAtEnd else { return nil }
            
            let nextPoint = point + step
            isAtEnd = nextPoint == to
            return nextPoint
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
    
    public static func - (lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x - rhs.x,
                     y: lhs.y - rhs.y)
    }
    
    public static func -= (lhs: inout Point, rhs: Point) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
    }
    
    public static func * (lhs: Point, rhs: Int) -> Point {
        return Point(x: lhs.x * rhs,
                     y: lhs.y * rhs)
    }
    
    public static func *= (lhs: inout Point, rhs: Int) {
        lhs.x *= rhs
        lhs.y *= rhs
    }
}

// MARK: Comparable
extension Point: Comparable {
    public static func < (lhs: Point, rhs: Point) -> Bool {
        return lhs.y < rhs.y || (lhs.y == rhs.y && lhs.x < rhs.x)
    }
}

// MARK: Collection Extremes
extension Collection where Element == Point {
    public func extremes() -> (min: Point, max: Point) {
        var min = Point(x: .max, y: .max)
        var max = Point(x: .min, y: .min)
        
        for p in self {
            min.x = Swift.min(min.x, p.x)
            min.y = Swift.min(min.y, p.y)
            max.x = Swift.max(max.x, p.x)
            max.y = Swift.max(max.y, p.y)
        }
        
        return (min, max)
    }
}

extension Collection {
    public func extremes(of transform: (Element) -> Point) -> (min: Point, max: Point) {
        var min = Point(x: .max, y: .max)
        var max = Point(x: .min, y: .min)
        
        for p in self.map(transform) {
            min.x = Swift.min(min.x, p.x)
            min.y = Swift.min(min.y, p.y)
            max.x = Swift.max(max.x, p.x)
            max.y = Swift.max(max.y, p.y)
        }
        
        return (min, max)
    }
}

extension Set where Element == Point {
    public func gridString(point: String = "#", space: String = " ") -> String {
        let maxPoint = extremes().max
        
        var output = ""
        for y in 0...maxPoint.y {
            var line = ""
            for x in 0...maxPoint.x {
                line += contains(.init(x: x, y: y)) ? "#" : " "
            }
            
            line.trimSuffix(while: \.isWhitespace)
            
            output += line
            output += "\n"
        }
        
        return output.trimmingCharacters(in: .newlines)
    }
}
