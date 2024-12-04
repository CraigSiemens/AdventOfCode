import Foundation

public struct Day3: Day {

    let headings: [String: Heading.Cardinal] = [
        "D": .north,
        "U": .south,
        "R": .east,
        "L": .west
    ]
    
    func parseWires(for input: Input) -> [[GridLine]] {
        input.lines
            .map { (line) -> [GridLine] in
                line.raw
                    .components(separatedBy: ",")
                    .map { (move) -> (Heading.Cardinal, Int) in
                        let heading = headings[String(move.prefix(1))]!
                        let amount = Int(move.dropFirst())!
                        return (heading, amount)
                }
                .reduce(into: [GridLine]()) { (result, move) in
                    let start = result.last?.end ?? Point(x: 0, y: 0)
                    result.append(GridLine(point: start,
                                           heading: move.0,
                                           amount: move.1))
                }
            }
    }
    
    public func part1Solution(for input: Input) -> String {
        let wires = parseWires(for: input)
        
        var intersections: [Point] = []
        for line1 in wires[0] {
            for line2 in wires[1] {
                if let point = line1.intersection(line2) {
                    intersections.append(point)
                }
            }
        }
        
        let minDistance = intersections
            .map { $0.manhattanDistance(to: .zero) }
            .filter { $0 > 0 }
            .min()
            ?? Int.min
        
        return "\(minDistance)"
    }

    public func part2Solution(for input: Input) -> String {
        let wires = parseWires(for: input)
        
        var intersectionDistances: [Int] = []

        var distance1 = 0
        for line1 in wires[0] {
            var distance2 = 0
            for line2 in wires[1] {
                if let point = line1.intersection(line2) {
                    let distance = distance1
                        + distance2
                        + line1.start.manhattanDistance(to: point)
                        + line2.start.manhattanDistance(to: point)
                    intersectionDistances.append(distance)
                }
                distance2 += line2.length
            }
            distance1 += line1.length
        }
        
        let minDistance = intersectionDistances
            .filter { $0 > 0 }
            .min()
            ?? Int.min
        
        return "\(minDistance)"
    }
}
