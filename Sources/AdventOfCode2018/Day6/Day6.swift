import Foundation

struct Day6: Day {
    public let number: Int = 6
    
    class Source: Hashable {
        static func == (lhs: Day6.Source, rhs: Day6.Source) -> Bool {
            return lhs.coordinate == rhs.coordinate
        }
        
        let coordinate: Point
        var area: Int = 0
        
        func incrementArea() {
            guard area != .max else { return }
            area += 1
        }
        
        func decrementArea() {
            guard area != .max else { return }
            area -= 1
        }
        
        init(coordinate: Point) {
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
    
    func parse(input: String) -> [Point] {
        return input
            .replacingOccurrences(of: " ", with: "")
            .components(separatedBy: .newlines)
            .map { $0.components(separatedBy: ",").compactMap({ s in Int(s) }) }
            .map { Point(x: $0[0], y: $0[1]) }
    }
    
    func floodFill(sources: [Source], condition: (Point, Source) -> Bool) {
        
        var field: [Point: Location] = [:]
        var actionQueue: [(Point, Source)] = sources.map { ($0.coordinate, $0) }
        
        var index = 0
        while index < actionQueue.count {
            let (coordinate, source) = actionQueue[index]
            index += 1
            
            guard condition(coordinate, source) else {
                continue
            }
            
            switch field[coordinate, default: .empty] {
            case .empty:
                field[coordinate] = .closestTo(source)
                source.incrementArea()
                actionQueue += coordinate.neighbours.map { ($0, source) }
            case .closestTo(let other):
                if other != source,
                    coordinate.manhattanDistance(to: source.coordinate) == coordinate.manhattanDistance(to: other.coordinate) {
                    field[coordinate] = .tied
                    other.decrementArea()
                }
            case .tied: break
            }
        }
        
    }
    
    public func part1Solution(for input: String = input) -> String {
        let coordinates = parse(input: input)
        let maxCoordinate = coordinates.reduce(into: Point(x: 0, y: 0)) {
            $0.x = max($0.x, $1.x)
            $0.y = max($0.y, $1.y)
        }
        
        let sources = coordinates.map { Source(coordinate: $0) }
        
        floodFill(sources: sources) { (coordinate, source) in
            let shouldContinue = (0...maxCoordinate.y).contains(coordinate.y)
                && (0...maxCoordinate.x).contains(coordinate.x)
            
            if !shouldContinue {
                source.area = .max
            }
            return shouldContinue
        }
        
        return sources
            .filter { $0.area != .max }
            .map { $0.area }
            .max()
            .flatMap { "\($0)" }
            ?? "UNKNOWN"
    }
    
    func part2Solution(for input: String, minDistance: Int) -> String {
        let coordinates = parse(input: input)
        var averageCoordinate = coordinates.reduce(into: Point(x: 0, y: 0)) {
            $0.x += $1.x
            $0.y += $1.y
        }
        averageCoordinate.x /= coordinates.count
        averageCoordinate.y /= coordinates.count
        
        let averageSource = Source(coordinate: averageCoordinate)
        
        floodFill(sources: [averageSource]) { (coordinate, _) in
            return coordinates
                .map(coordinate.manhattanDistance(to: ))
                .sum()
                < minDistance
        }
        
        return "\(averageSource.area)"
    }

    
    public func part2Solution(for input: String = input) -> String {
        return part2Solution(for: input, minDistance: 10000)
    }
}
