import Foundation

public struct Day22: Day {
    enum Direction {
        case right, up, left, down
        
        func nextIndex(from: (Int, Int)) -> (Int, Int) {
            switch self {
            case .right: return (from.0 + 1, from.1)
            case .up: return (from.0, from.1 - 1)
            case .left: return (from.0 - 1, from.1)
            case .down: return (from.0, from.1 + 1)
            }
        }
        
        var leftTurn: Direction {
            switch self {
            case .right: return .up
            case .up: return .left
            case .left: return .down
            case .down: return .right
            }
        }
        
        var rightTurn: Direction {
            switch self {
            case .right: return .down
            case .up: return .right
            case .left: return .up
            case .down: return .left
            }
        }
        
        var reverse: Direction {
            switch self {
            case .right: return .left
            case .up: return .down
            case .left: return .right
            case .down: return .up
            }
        }
    }
    
    enum State {
        case clean, weakened, infected, flagged
        
        //    var next: State {
        //        switch self {
        //        case .clean: return .weakened
        //        case .weakened: return .infected
        //        case .infected: return .flagged
        //        case .flagged: return .clean
        //        }
        //    }
    }
    
    func parse(input: String) -> [[State]] {
        return input
            .components(separatedBy: "\n")
            .filter { !$0.isEmpty }
            .map { l in l.map { $0 == "#" ? State.infected : State.clean } }
    }
    
    func createInfiniteField(center: [[State]]) -> [[State]] {
        let size = 9999 // must be odd
        let row = Array(repeating: State.clean, count: size)
        var field = Array(repeating: row, count: size)
        
        let offset = (size - center.count) / 2
        for x in 0..<center.count {
            for y in 0..<center.count {
                field[offset+y][offset+x] = center[y][x]
            }
        }
        
        return field
    }
    
    public func part1Solution(for input: String = input) -> String {
        
        var field = createInfiniteField(center: parse(input: input))
        var (x, y) = (field.count / 2, field.count / 2)
        var direction = Direction.up
        var infectCount = 0
        
        for _ in 0..<10000 {
            if field[y][x] == .infected {
                field[y][x] = .clean
                direction = direction.rightTurn
            } else {
                field[y][x] = .infected
                direction = direction.leftTurn
                infectCount += 1
            }
            (x, y) = direction.nextIndex(from: (x, y))
        }
        
        return infectCount.description
    }
    
    public func part2Solution(for input: String = input) -> String {
        var field = createInfiniteField(center: parse(input: input))
        var (x, y) = (field.count / 2, field.count / 2)
        var direction = Direction.up
        var infectCount = 0
        
        for _ in 0..<10000000 {
            switch field[y][x] {
            case .clean:
                field[y][x] = .weakened
                direction = direction.leftTurn
            case .weakened:
                field[y][x] = .infected
                infectCount += 1
            case .infected:
                field[y][x] = .flagged
                direction = direction.rightTurn
            case .flagged:
                field[y][x] = .clean
                direction = direction.reverse
            }
            
            (x, y) = direction.nextIndex(from: (x, y))
        }
        
        return infectCount.description
    }
}
