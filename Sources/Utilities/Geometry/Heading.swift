//
//  Heading.swift
//  AdventOfCode2018
//
//  Created by Craig Siemens on 2018-12-14.
//

import Foundation

public enum Heading: CaseIterable {
    // Reading Order
    case north, west, east, south
    
    public var opposite: Heading {
        switch self {
        case .north: return .south
        case .east:  return .west
        case .south: return .north
        case .west:  return .east
        }
    }
    
    public var left: Heading {
        switch self {
        case .north: return .west
        case .east:  return .north
        case .south: return .east
        case .west:  return .south
        }
    }
    
    public var right: Heading {
        switch self {
        case .north: return .east
        case .east:  return .south
        case .south: return .west
        case .west:  return .north
        }
    }
    
    public func turn(_ direction: Direction) -> Heading {
        switch direction {
        case .forward:  return self
        case .backward: return opposite
        case .left:     return left
        case .right:    return right
        }
    }
    
    public var arrow: Character {
        switch self {
        case .north:
            return "^"
        case .west:
            return "<"
        case .east:
            return ">"
        case .south:
            return "v"
        }
    }
}

public enum Direction {
    case forward, backward, left, right
}
