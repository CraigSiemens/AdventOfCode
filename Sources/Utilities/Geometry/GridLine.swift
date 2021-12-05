import Foundation

public struct GridLine {
    public let start: Point
    public let end: Point
    
    public var length: Int {
        abs(start.x - end.x) + abs(start.y - end.y)
    }
    
    public var isVertical: Bool {
        start.x == end.x
    }
    
    public var isHorizontal: Bool {
        start.y == end.y
    }
    
    public var isDiagonal: Bool {
        abs(start.x - end.x) == abs(start.y - end.y)
    }
    
    public var minX: Int { min(start.x, end.x) }
    public var maxX: Int { max(start.x, end.x) }
    public var minY: Int { min(start.y, end.y) }
    public var maxY: Int { max(start.y, end.y) }
    
    public init(start: Point, end: Point) {
        self.start = start
        self.end = end
    }
    
    public init(point: Point, heading: Heading, amount: Int) {
        self.start = point
        self.end = point.moved(heading, amount: amount)
    }
    
    public func intersection(_ other: GridLine) -> Point? {
        guard isVertical != other.isVertical else {
            return nil
        }
        
        let vertical = isVertical ? self : other
        let horizontal = isVertical ? other : self
                
        guard vertical.minY...vertical.maxY ~= horizontal.start.y,
            horizontal.minX...horizontal.maxX ~= vertical.start.x else {
                return nil
        }
        
        return Point(x: vertical.start.x, y: horizontal.start.y)
    }
    
    public var points: [Point] {
        if isVertical {
            return (min(start.y, end.y)...max(start.y, end.y))
                .map { Point(x: start.x, y: $0) }
        } else if isHorizontal {
            return (min(start.x, end.x)...max(start.x, end.x))
                .map { Point(x: $0, y: start.y) }
        } else if isDiagonal {
            let xRange = stride(
                from: start.x,
                through: end.x,
                by: (end.x - start.x).signum()
            )
            
            let yRange = stride(
                from: start.y,
                through: end.y,
                by: (end.y - start.y).signum()
            )
            
            return zip(xRange, yRange).map(Point.init)
        } else {
            return []
        }
    }
}
