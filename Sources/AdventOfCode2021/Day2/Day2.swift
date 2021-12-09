import Foundation
import Utilities

public struct Day2: Day {
    enum Command: Decodable {
        case forward(Int)
        case down(Int)
        case up(Int)
    }
    
    func parseCommands(for input: Input) -> [Command] {
        input
            .lines
            .map { line -> Command in
                let parts = line.words
                let distance = parts[1].integer!
                
                switch parts[0].raw {
                case "forward": return .forward(distance)
                case "down": return .down(distance)
                case "up": return .up(distance)
                default: fatalError()
                }
            }
    }
    
    public func part1Solution(for input: Input) -> String {
        let totalDistance = parseCommands(for: input)            .reduce(into: Point.zero) { point, command in
                switch command {
                case let .forward(distance):
                    point.x += distance
                case let .down(distance):
                    point.y += distance
                case let .up(distance):
                    point.y -= distance
                }
            }
        
        return "\(totalDistance.x * totalDistance.y)"
    }

    public func part2Solution(for input: Input) -> String {
        struct Submarine {
            var aim: Int = 0
            var position: Point = .zero
        }
        
        let submarine = parseCommands(for: input)            .reduce(into: Submarine()) { submarine, command in
                switch command {
                case let .forward(distance):
                    submarine.position.x += distance
                    submarine.position.y += submarine.aim * distance
                case let .down(distance):
                    submarine.aim += distance
                case let .up(distance):
                    submarine.aim -= distance
                }
            }
        
        return "\(submarine.position.x * submarine.position.y)"
    }
}
