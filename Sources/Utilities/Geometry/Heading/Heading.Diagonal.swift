import Foundation

extension Heading {
    public enum Diagonal: CaseIterable {
        // Clockwise Order
        case northWest
        case northEast
        case southEast
        case southWest
    }
}

extension Heading.Diagonal {
    public var point: Point {
        switch self {
        case .northWest: .init(x: -1, y: -1)
        case .northEast: .init(x: 1, y: -1)
        case .southEast: .init(x: 1, y: 1)
        case .southWest: .init(x: -1, y: 1)
        }
    }
    
    public var opposite: Heading.Diagonal {
        switch self {
        case .northWest: return .southEast
        case .northEast:  return .southWest
        case .southEast:  return .northWest
        case .southWest: return .northEast
        }
    }
    
    public var left: Heading.Diagonal {
        switch self {
        case .northWest: return .southWest
        case .northEast: return .northWest
        case .southEast: return .northEast
        case .southWest: return .southEast
        }
    }
    
    public var right: Heading.Diagonal {
        switch self {
        case .northWest: return .northEast
        case .northEast: return .southEast
        case .southEast: return .southWest
        case .southWest: return .northWest
        }
    }
    
    public func turn(_ direction: Direction) -> Heading.Diagonal {
        switch direction {
        case .forward:  return self
        case .backward: return opposite
        case .left:     return left
        case .right:    return right
        }
    }
    
    public func direction(to heading: Heading.Diagonal) -> Direction {
        for direction in Direction.allCases {
            if turn(direction) == heading {
                return direction
            }
        }
        
        fatalError("Impossible case detected")
    }
    
    public var arrow: Character {
        switch self {
        case .northWest:
            return "↖"
        case .northEast:
            return "↗"
        case .southEast:
            return "↘"
        case .southWest:
            return "↙"
        }
    }
}
