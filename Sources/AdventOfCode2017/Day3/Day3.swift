import Foundation

public struct Day3: Day {
    public func part1Solution(for input: Input) -> String {
        let input = input.integer!
        guard input > 1 else { return "0" }
        
        var size = 0
        for ringIndex in 0..<1000 {
            let ringEdgeSize = (ringIndex * 2 + 1)
            size = ringEdgeSize * ringEdgeSize
            
            guard size < input else {
                let steps = (size - input) % (ringEdgeSize - 1)
                let centeredSteps = steps - ((ringEdgeSize - 1) / 2)
                
                return "\(ringIndex + abs(centeredSteps))"
            }
        }
        
        return "0"
    }

    public func part2Solution(for input: Input) -> String {
        let input = input.integer!
        
        enum Direction {
            case right, up, left, down
            
            var next: Direction {
                switch self {
                case .right: return .up
                case .up: return .left
                case .left: return .down
                case .down: return .right
                }
            }
            
            func nextIndex(from: (Int, Int)) -> (Int, Int) {
                switch self {
                case .right: return (from.0 + 1, from.1)
                case .up: return (from.0, from.1 - 1)
                case .left: return (from.0 - 1, from.1)
                case .down: return (from.0, from.1 + 1)
                }
            }
        }

        func neighbors(for index: (Int, Int)) -> [(Int, Int)] {
            return [
                (index.0+1, index.1),
                (index.0+1, index.1-1),
                (index.0, index.1-1),
                (index.0-1, index.1-1),
                (index.0-1, index.1),
                (index.0-1, index.1+1),
                (index.0, index.1+1),
                (index.0+1, index.1+1)
            ]
        }

        let size = 21
        var spiralMemory = Array(repeating: Array(repeating: 0, count: size), count: size)
        
        var index = (size/2, size/2)
        var direction = Direction.right
        spiralMemory[index] = 1
        
        while input > spiralMemory[index] {
            index = direction.nextIndex(from: index)
            
            spiralMemory[index] = neighbors(for: index)
                .map { spiralMemory[$0] }
                .reduce(0, +)
            
            if spiralMemory[direction.next.nextIndex(from: index)] == 0 {
                direction = direction.next
            }
        }
        
        for line in spiralMemory {
            print(line)
        }
        
        return spiralMemory[index].description
    }
}

private extension Array where Element == [Int] {
    subscript(index: (Int, Int)) -> Int {
        get {
            guard indices.contains(index.0),
                self[index.0].indices.contains(index.1) else {
                    return 0
            }
            return self[index.0][index.1]
        }
        set(newValue) {
            guard indices.contains(index.0),
                self[index.0].indices.contains(index.1) else {
                    return
            }
            self[index.0][index.1] = newValue
        }
    }
}
