import Foundation
import Utilities

public struct Day6: Day {
    public init() {}

    class Source: Hashable {
        static func == (lhs: Day6.Source, rhs: Day6.Source) -> Bool {
            return lhs.coordinate == rhs.coordinate
        }
        
        let coordinate: Coordinate
        var area: Int = 0
        
        func incrementArea() {
            guard area != .max else { return }
            area += 1
        }
        
        func decrementArea() {
            guard area != .max else { return }
            area -= 1
        }
        
        init(coordinate: Coordinate) {
            self.coordinate = coordinate
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(coordinate)
        }
    }
    
    enum Location {
        case empty
        case closestTo(Source)
        case tied
    }
    
    func parse(input: String) -> [Coordinate] {
        return input
            .replacingOccurrences(of: " ", with: "")
            .components(separatedBy: .newlines)
            .map { $0.components(separatedBy: ",").compactMap({ s in Int(s) }) }
            .map { Coordinate(x: $0[0], y: $0[1]) }
    }
    
    public func part1Solution(for input: String = input) -> String {
        let coordinates = parse(input: input)
        let maxCoordinate = coordinates.reduce(into: Coordinate(x: 0, y: 0)) {
            $0.x = max($0.x, $1.x)
            $0.y = max($0.y, $1.y)
        }
        
        let sources = coordinates.map { Source(coordinate: $0) }
        
        var field = Array(repeating: Array(repeating: Location.empty,count: maxCoordinate.x + 1),
                          count: maxCoordinate.y + 1)
        var actionStack: [(Coordinate, Source)] = sources.map { ($0.coordinate, $0) }
        
        while let (coordinate, source) = actionStack.first {
            actionStack.removeFirst()
            
            guard (0...maxCoordinate.y).contains(coordinate.y),
                (0...maxCoordinate.x).contains(coordinate.x) else {
                    source.area = .max
                    continue
            }
            
            switch field[coordinate.y][coordinate.x] {
            case .empty:
                field[coordinate.y][coordinate.x] = .closestTo(source)
                source.incrementArea()
                actionStack += coordinate.neighbours.map { ($0, source) }
            case .closestTo(let other):
                if other != source,
                    coordinate.manhattanDistance(to: source.coordinate) == coordinate.manhattanDistance(to: other.coordinate) {
                    field[coordinate.y][coordinate.x] = .tied
                    other.decrementArea()
                }
            case .tied: break
            }
        }
        
        return sources
            .filter { $0.area != .max }
            .map { $0.area }
            .max()
            .flatMap { "\($0)" }
            ?? "UNKNOWN"
    }

    public func part2Solution(for input: String = input) -> String {
        return "not solved"
    }
}
