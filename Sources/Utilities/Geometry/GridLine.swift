import Foundation

public struct GridLine {
    public let start: Point
    public let end: Point
    public let length: Int
    
    public var isVertical: Bool {
        start.x == end.x
    }
    
    public var minX: Int { min(start.x, end.x) }
    public var maxX: Int { max(start.x, end.x) }
    public var minY: Int { min(start.y, end.y) }
    public var maxY: Int { max(start.y, end.y) }
        
    public init(point: Point, heading: Heading, amount: Int) {
        self.start = point
        self.end = point.moved(heading, amount: amount)
        self.length = amount
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
}
