import Foundation

public struct Day19: Day {
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
    }
    
    func followPath(input: String) -> (String, Int) {
        let maze = parseMaze(input: input)
        
        var (x, y) = (maze[0].firstIndex(of: "|")!, 0)
        var direction = Direction.down
        var seenLetters: [Character] = []
        var steps = 0
        
        let isValid = { (i: Int, j: Int) -> Bool in
            return j >= 0 && j < maze.count && i >= 0 && i < maze[j].count
        }
        
        while isValid(x, y) {
            steps += 1
            
            if CharacterSet.letters.contains(maze[y][x].unicodeScalars.first!) {
                seenLetters.append(maze[y][x])
            }
            
            var (x2, y2) = direction.nextIndex(from: (x, y))
            var nextDirection = direction
            
            defer {
                (x, y) = (x2, y2)
                direction = nextDirection
            }
            
            guard !isValid(x2, y2) || maze[y2][x2] == " " else { continue }
            nextDirection = direction.leftTurn
            (x2, y2) = nextDirection.nextIndex(from: (x, y))
            
            guard !isValid(x2, y2) || maze[y2][x2] == " " else { continue }
            nextDirection = direction.rightTurn
            (x2, y2) = nextDirection.nextIndex(from: (x, y))
            
            guard isValid(x2, y2) && maze[y2][x2] != " " else { break }
        }
        
        return (seenLetters.map { String($0) }.joined(), steps)
    }
    
    func parseMaze(input: String) -> [[Character]] {
        let maze = input
            .components(separatedBy: "\n")
        
        let lineLength = maze.map { $0.count }.max() ?? 0
        
        return maze
            .map { $0.padding(toLength: lineLength, withPad: " ", startingAt: 0) }
            .map { line in line.map { $0 } }
    }
    
    public func part1Solution(for input: String = input) -> String {
        
        return followPath(input: input).0.description
    }
    
    public func part2Solution(for input: String = input) -> String {
        return followPath(input: input).1.description
    }
}
