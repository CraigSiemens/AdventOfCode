public struct Point3: Hashable {
    public var x, y, z: Int
    
    public init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    /// The total number of horizontal and vertical steps between the two points.
    public func manhattanDistance(to other: Point3) -> Int {
        return abs(x - other.x) + abs(y - other.y) + abs(z - other.z)
    }
    
    public func area(with other: Point3) -> Int {
        return abs(x - other.x) * abs(y - other.y) * abs(z - other.z)
    }
}

// MARK: - Axis
public extension Point3 {
    static var xPos = Point3(x: 1, y: 0, z: 0)
    static var xNeg = Point3(x: -1, y: 0, z: 0)
    static var yPos = Point3(x: 0, y: 1, z: 0)
    static var yNeg = Point3(x: 0, y: -1, z: 0)
    static var zPos = Point3(x: 0, y: 0, z: 1)
    static var zNeg = Point3(x: 0, y: 0, z: -1)
}

// MARK: - Neighbours
extension Point3 {
    public var faceNeighbours: [Point3] {
        let directions: [Point3] = [.xPos, .xNeg, .yPos, .yNeg, .zPos, .zNeg]
        
        return directions.map { self + $0 }
    }
    
    func isFaceNeighbour(with other: Point3) -> Bool {
        manhattanDistance(to: other) == 1
    }
    
    public var edgeNeighbours: [Point3] {
        let directions: [Point3] = [
            .init(x: -1, y: 1, z: 0),
            .init(x: -1, y: 0, z: -1),
            .init(x: -1, y: 0, z: 1),
            .init(x: -1, y: -1, z: 0),
            .init(x: 0, y: 1, z: -1),
            .init(x: 0, y: 1, z: 1),
            .init(x: 0, y: -1, z: 1),
            .init(x: 0, y: -1, z: -1),
            .init(x: 1, y: 1, z: 0),
            .init(x: 1, y: 0, z: -1),
            .init(x: 1, y: 0, z: 1),
            .init(x: 1, y: -1, z: 0),
        ]
        
        return directions.map { self + $0 }
    }
    
    func isEdgeNeighbour(with other: Point3) -> Bool {
        manhattanDistance(to: other) == 2
    }

}

// MARK: - Angle
extension Point3 {
    /// A point containing the sign of the x, y, and z values.
    public var signum: Point3 {
        Point3(x: x.signum(), y: y.signum(), z: z.signum())
    }
    
    // The shortest representation of the point that can be represented with whole numbers
    public var normalized: Point3 {
        let divisor = abs(x.gcd(with: y).gcd(with: z))
        guard divisor != 0 else { return .zero }
        return Point3(x: x / divisor, y: y / divisor, z: z / divisor)
    }
    
    public func angle(to other: Point3) -> Point3 {
        (other - self).normalized
    }
}

// MARK: - Constants
extension Point3 {
    public static let zero = Point3(x: 0, y: 0, z: 0)
}

// MARK: Arithmetic
extension Point3 {
    public static func + (lhs: Point3, rhs: Point3) -> Point3 {
        Point3(
            x: lhs.x + rhs.x,
            y: lhs.y + rhs.y,
            z: lhs.z + rhs.z
        )
    }
    
    public static func += (lhs: inout Point3, rhs: Point3) {
        lhs.x += rhs.x
        lhs.y += rhs.y
        lhs.z += rhs.z
    }
    
    public static func - (lhs: Point3, rhs: Point3) -> Point3 {
        Point3(
            x: lhs.x - rhs.x,
            y: lhs.y - rhs.y,
            z: lhs.z - rhs.z
        )
    }
    
    public static func -= (lhs: inout Point3, rhs: Point3) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
        lhs.z -= rhs.z
    }
    
    public static func * (lhs: Point3, rhs: Int) -> Point3 {
        Point3(
            x: lhs.x * rhs,
            y: lhs.y * rhs,
            z: lhs.z * rhs
        )
    }
    
    public static func *= (lhs: inout Point3, rhs: Int) {
        lhs.x *= rhs
        lhs.y *= rhs
        lhs.z *= rhs
    }
}

// MARK: Collection Extremes
extension Collection where Element == Point3 {
    public func extremes() -> (min: Point3, max: Point3) {
        var min = Point3(x: .max, y: .max, z: .max)
        var max = Point3(x: .min, y: .min, z: .min)
        
        for p in self {
            min.x = Swift.min(min.x, p.x)
            min.y = Swift.min(min.y, p.y)
            min.z = Swift.min(min.z, p.z)
            
            max.x = Swift.max(max.x, p.x)
            max.y = Swift.max(max.y, p.y)
            max.z = Swift.max(max.z, p.z)
        }
        
        return (min, max)
    }
}

extension Collection {
    public func extremes(of transform: (Element) -> Point3) -> (min: Point3, max: Point3) {
        var min = Point3(x: .max, y: .max, z: .max)
        var max = Point3(x: .min, y: .min, z: .min)
        
        for p in map(transform) {
            min.x = Swift.min(min.x, p.x)
            min.y = Swift.min(min.y, p.y)
            min.z = Swift.min(min.z, p.z)
            
            max.x = Swift.max(max.x, p.x)
            max.y = Swift.max(max.y, p.y)
            max.z = Swift.max(max.z, p.z)
        }
        
        return (min, max)
    }
}
