import Algorithms
import Foundation
import Utilities

public struct Day22: Day {
    public func part1Solution(for input: Input) -> Int {
        let parts = input.lines
            .split(on: \.isEmpty)
        
        var rocks: Set<Point> = []
        var xRanges: [Int: IndexRangeSet] = [:]
        var yRanges: [Int: IndexRangeSet] = [:]
        
        for (y, line) in parts[0].enumerated() {
            for (x, char) in line.characters.enumerated()
            where !char.isWhitespace {
                if char == "#" {
                    rocks.insert(.init(x: x, y: y))
                }
                
                xRanges[x, default: .init()].insert(y...y)
                yRanges[y, default: .init()].insert(x...x)
            }
        }
        
        let scanner = Scanner(string: parts[1].last!.raw)
        
        var position = Point(x: yRanges[0]![0].lowerBound, y: 0)
        var heading = Heading.Cardinal.east
        
        while !scanner.isAtEnd {
            guard let steps = scanner.scanInt() else { break }
            for _ in 0..<steps {
                var newPosition = position.moved(heading)
                
                switch heading {
                case .north, .south:
                    let range = xRanges[newPosition.x]![0]
                    newPosition.y = newPosition.y.wrapped(in: range)
                case .west, .east:
                    let range = yRanges[newPosition.y]![0]
                    newPosition.x = newPosition.x.wrapped(in: range)
                }
                
                guard !rocks.contains(newPosition) else { break }
                position = newPosition
            }
            
            guard let turn = scanner.scanCharacter() else { break }
            heading = heading.turn(turn == "L" ? .left : .right)
        }
        
        let headings: [Heading.Cardinal] = [.east, .south, .west, .north]
        
        return (position.y + 1) * 1000
        + (position.x + 1) * 4
        + headings.firstIndex(of: heading)!
    }

    public func part2Solution(for input: Input) -> Int {
        let parts = input.lines
            .split(on: \.isEmpty)
        
        var rocks: Set<Point> = []
        var xRanges: [Int: IndexRangeSet] = [:]
        var yRanges: [Int: IndexRangeSet] = [:]
        
        for (y, line) in parts[0].enumerated() {
            for (x, char) in line.characters.enumerated()
            where !char.isWhitespace {
                if char == "#" {
                    rocks.insert(.init(x: x, y: y))
                }
                
                xRanges[x, default: .init()].insert(y...y)
                yRanges[y, default: .init()].insert(x...x)
            }
        }
        
        let cube = Cube(xRanges: xRanges, yRanges: yRanges)
        let scanner = Scanner(string: parts[1].last!.raw)
        
        var position = Point(x: yRanges[0]![0].lowerBound, y: 0)
        var heading = Heading.Cardinal.east
        
        while !scanner.isAtEnd {
            guard let steps = scanner.scanInt() else { break }
            for _ in 0..<steps {
                let (newPosition, newHeading) = cube.move(point: position, heading: heading)
                
                guard !rocks.contains(newPosition) else { break }
                position = newPosition
                heading = newHeading
            }
            
            guard let turn = scanner.scanCharacter() else { break }
            heading = heading.turn(turn == "L" ? .left : .right)
        }
        
        let headings: [Heading.Cardinal] = [.east, .south, .west, .north]
        
        return (position.y + 1) * 1000
        + (position.x + 1) * 4
        + headings.firstIndex(of: heading)!
    }
}

private struct Cube {
    struct Face {
        let min: Point
        let max: Point
    }
    
    struct Edge {
        typealias ConnectedFace = (point: Point, heading: Heading.Cardinal)
        
        let from: ConnectedFace
        let to: ConnectedFace
    }
    
    private let faceSize: Int
    private var faces: Grid<Face> = [:]
    private var edges: [Point: [Heading.Cardinal: Edge]] = [:]
    
    init(
        xRanges: [Int: IndexRangeSet],
        yRanges: [Int: IndexRangeSet]
    ) {
        let xRanges = xRanges.compactMapValues(\.first)
        let yRanges = yRanges.compactMapValues(\.first)
        
        let minXSize = xRanges.map { $0.value.count }.min()!
        let minYSize = yRanges.map { $0.value.count }.min()!
        self.faceSize = min(minXSize, minYSize)
        
        let (minY, maxY) = yRanges.keys.extremes()
        for y in stride(from: minY, to: maxY, by: faceSize) {
            let minX = yRanges[y]!.lowerBound
            let maxX = yRanges[y]!.upperBound
            for x in stride(from: minX, to: maxX, by: faceSize) {
                let min = Point(x: x, y: y)
                
                var max = min
                max.x += faceSize - 1
                max.y += faceSize - 1
                
                faces[min / faceSize] = Face(min: min, max: max)
            }
        }
        
        func addEdges(from: Edge.ConnectedFace, to: Edge.ConnectedFace) {
            edges[from.point, default: [:]][from.heading] = .init(from: from, to: to)
            
            edges[to.point, default: [:]][to.heading.opposite] = .init(
                from: (point: to.point, heading: to.heading.opposite),
                to: (point: from.point, heading: from.heading.opposite)
            )
        }
        
        // Make edges for connected faces in input
        for point in faces.keys {
            for heading in Heading.Cardinal.allCases {
                let neighbour = point.moved(heading)
                guard faces[neighbour] != nil else { continue }
                
                addEdges(
                    from: (point: point, heading: heading),
                    to: (point: neighbour, heading: heading)
                )
            }
        }
        
        
        // Make edges for faces at "right angles" (probably not the right term in 3d)
        // ex. connect A.west to B.north if there's A.south > C.north and C.west > B.east
        //   +-+
        //   |A|
        // +-+-+
        // |B|C|
        // +-+-+
        var facesMissingEdges = Set(faces.keys)
        while !facesMissingEdges.isEmpty {
            for face in facesMissingEdges {
                for heading in Heading.Cardinal.allCases {
                    guard edges[face]![heading] == nil else { continue }
                    
                    if let existing = edges[face]![heading.left]?.to,
                       let new = edges[existing.point]?[existing.heading.right]?.to {
                        addEdges(
                            from: (point: face, heading: heading),
                            to: (point: new.point, heading: new.heading.left)
                        )
                    }
                    
                    if let existing = edges[face]![heading.right]?.to,
                       let new = edges[existing.point]?[existing.heading.left]?.to {
                        addEdges(
                            from: (point: face, heading: heading),
                            to: (point: new.point, heading: new.heading.right)
                        )
                    }
                }
                
                if edges[face]!.count == Heading.Cardinal.allCases.count {
                    facesMissingEdges.remove(face)
                }
            }
        }
    }
    
    func move(point: Point, heading: Heading.Cardinal) -> (point: Point, heading: Heading.Cardinal) {
        // Move point along heading
        var newPoint = point.moved(heading)
        
        // If point not in face
        if face(for: newPoint) != nil {
            return (newPoint, heading)
        }
        
        // Get edge
        let end = edges[point / faceSize]![heading]!.to
        
        let startFace = face(for: point)!
        let endFace = faces[end.point]!
        
        // normalize point in start face
        newPoint -= startFace.min
        
        // rotate point around the center of the face
        switch heading.direction(to: end.heading) {
        case .forward:
            break
        case .backward:
            newPoint = .init(x: (faceSize - 1) - newPoint.x, y: (faceSize - 1) - newPoint.y)
        case .left:
            newPoint = .init(x: newPoint.y, y: (faceSize - 1) - newPoint.x)
        case .right:
            newPoint = .init(x: (faceSize - 1) - newPoint.y, y: newPoint.x)
        }
        
        // shift point to enter the new face, since newPoint exited the previous face
        newPoint = newPoint.moved(end.heading.opposite, amount: faceSize)
        
        // move normalized point to end face
        newPoint += endFace.min
        
        return (newPoint, end.heading)
    }
    
    private func face(for point: Point) -> Face? {
        guard point.x >= 0, point.y >= 0 else { return nil }
        return faces[point / faceSize]
    }
}
