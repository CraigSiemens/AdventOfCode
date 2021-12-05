import Foundation

public struct Day11: Day {
    private typealias Position = (x: Int, y: Int)
    
    private enum Direction: String {
        case n, ne, se, s, sw, nw
        
        func nextPosition(from: Position) -> Position {
            switch self {
            case .n: return (from.x, from.y+1)
            case .s: return (from.x, from.y-1)
                
            case .nw: return (from.x-1, from.y+1)
            case .sw: return (from.x-1, from.y)
                
            case .ne: return (from.x+1, from.y)
            case .se: return (from.x+1, from.y-1)
            }
        }
    }
    
    private func distance(from: Position, to: Position) -> Int {
        let dx = to.x - from.x
        let dy = to.y - from.y
        
        if (dx < 0) == (dy < 0) {
            return abs(dx + dy)
        } else {
            return max(abs(dx), abs(dy))
        }
    }
    
    public func part1Solution(for input: String = input) -> String {
        let start: Position = (0, 0)
        let end: Position = input
            .components(separatedBy: ",")
            .compactMap { Direction(rawValue: $0) }
            .reduce(start) { $1.nextPosition(from: $0) }
        
        return "\(distance(from: start, to: end))"
    }
    
    public func part2Solution(for input: String = input) -> String {
        let start: Position = (0, 0)
        let (_, dist) = input
            .components(separatedBy: ",")
            .compactMap { Direction(rawValue: $0) }
            .reduce((start, 0)) {
                let next = $1.nextPosition(from: $0.0)
                return (next, max(distance(from: start, to: next), $0.1))
            }
        
        return "\(dist)"
    }
}
