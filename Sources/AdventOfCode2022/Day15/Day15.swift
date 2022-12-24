import Algorithms
import Foundation
import Utilities

public struct Day15: Day {
    func parse(input: Input) -> (y: Int, sensorDistances: [(Point, Int)], points: Set<Point>) {
        let lines = input.lines
        let y = lines[0].int!
        
        var points: Set<Point> = []
        
        let sensorDistances = lines.dropFirst()
            .map { line in
                let value = line.words(byCharactersIn: "=,:").integers
                let sensor = Point(x: value[0], y: value[1])
                let beacon = Point(x: value[2], y: value[3])
                
                points.insert(sensor)
                points.insert(beacon)
                
                return (sensor, sensor.manhattanDistance(to: beacon))
            }
        
        return (y, sensorDistances, points)
    }
    
    public func part1Solution(for input: Input) -> Int {
        let (y, sensorDistances, points) = parse(input: input)
        
        let (min, max) = sensorDistances
            .flatMap { sensor, distance in
                Heading.allCases.map { sensor.moved($0, amount: distance) }
            }
            .extremes()
        
        var count = 0
        for x in min.x...max.x {
            let currentPoint = Point(x: x, y: y)
            
            let cantContainBeacon = !points.contains(currentPoint)
            && sensorDistances.contains { sensor, distance in
                currentPoint.manhattanDistance(to: sensor) <= distance
            }
            
            if cantContainBeacon {
                count += 1
            }
        }
        
        return count
    }

    public func part2Solution(for input: Input) -> Int {
        let (y, sensorDistances, _) = parse(input: input)
        let maxY = y * 2
        
        for y in 0...maxY {
            var ranges = RangeSet<Int>()
            
            for (sensor, distance) in sensorDistances {
                let currentYDistance = abs(sensor.y - y)
                guard currentYDistance <= distance else { continue }
                let diff = distance - currentYDistance
                
                let minX = sensor.x - diff
                let maxX = sensor.x + diff
                
                ranges.insert(minX...maxX)
            }
            
            let pair = ranges.adjacentPairs()
                .first { $1.lowerBound - $0.upperBound == 2 }
            
            if let pair {
                return (pair.0.upperBound + 1) * 4000000 + y
            }
        }
        
        return -1
    }
}

struct RangeSet<Bounds: Comparable> {
    private var ranges: [Element] = []
    
    mutating func insert(_ range: ClosedRange<Bounds>) {
        var range = range
        
        for i in ranges.indices.reversed()
        where ranges[i].overlaps(range) {
            let lowerBound = Swift.min(range.lowerBound, ranges[i].lowerBound)
            let upperBound = Swift.max(range.upperBound, ranges[i].upperBound)
            range = lowerBound...upperBound
            
            ranges.remove(at: i)
        }
        
        ranges.append(range)
    }
}

extension RangeSet: Collection {
    typealias Index = Int
    typealias Element = ClosedRange<Bounds>
    
    
    var startIndex: Index { ranges.startIndex }
    var endIndex: Index { ranges.endIndex }
    
    subscript(position: Index) -> Element {
        ranges[position]
    }
    
    func index(after i: Index) -> Index {
        ranges.index(after: i)
    }
}
