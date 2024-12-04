import Foundation

extension Heading {
    public enum Cardinal: CaseIterable {
        // Clockwise Order
        case north
        case east
        case south
        case west
    }
}
 
extension Heading.Cardinal {
    public var point: Point {
        switch self {
        case .north: return .init(x: 0, y: -1)
        case .east:  return .init(x: 1, y: 0)
        case .south: return .init(x: 0, y: 1)
        case .west:  return .init(x: -1, y: 0)
        }
    }
    
    public var opposite: Heading.Cardinal {
        switch self {
        case .north: return .south
        case .east:  return .west
        case .south: return .north
        case .west:  return .east
        }
    }
    
    public var left: Heading.Cardinal {
        switch self {
        case .north: return .west
        case .east:  return .north
        case .south: return .east
        case .west:  return .south
        }
    }
    
    public var right: Heading.Cardinal {
        switch self {
        case .north: return .east
        case .east:  return .south
        case .south: return .west
        case .west:  return .north
        }
    }
    
    public func turn(_ direction: Direction) -> Heading.Cardinal {
        switch direction {
        case .forward:  return self
        case .backward: return opposite
        case .left:     return left
        case .right:    return right
        }
    }
    
    public func direction(to heading: Heading.Cardinal) -> Direction {
        for direction in Direction.allCases {
            if turn(direction) == heading {
                return direction
            }
        }
        
        fatalError("Impossible case detected")
    }
    
    public var arrow: Character {
        switch self {
        case .north:
            return "↑"
        case .west:
            return "←"
        case .east:
            return "→"
        case .south:
            return "↓"
        }
    }
}
