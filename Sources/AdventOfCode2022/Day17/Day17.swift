import Algorithms
import Foundation
import Utilities

public struct Day17: Day {
    struct Piece {
        var origin: Point = .zero
        private let pixels: [Point]
        
        var pixelSet: Set<Point> {
            Set(pixels.map { $0 + origin })
        }
        
        static let all = [hLine, plus, l, vLine, square]

        // ####
        static let hLine = Piece(pixels: [
            .init(x: 0, y: 0),
            .init(x: 1, y: 0),
            .init(x: 2, y: 0),
            .init(x: 3, y: 0)
        ])
        
        // .#.
        // ###
        // .#.
        static let plus = Piece(pixels: [
            .init(x: 0, y: 1),
            .init(x: 1, y: 0),
            .init(x: 1, y: 1),
            .init(x: 1, y: 2),
            .init(x: 2, y: 1)
        ])
        
        // ..#
        // ..#
        // ###
        static let l = Piece(pixels: [
            .init(x: 0, y: 0),
            .init(x: 1, y: 0),
            .init(x: 2, y: 0),
            .init(x: 2, y: 1),
            .init(x: 2, y: 2)
        ])
        
        // #
        // #
        // #
        // #
        static let vLine = Piece(pixels: [
            .init(x: 0, y: 0),
            .init(x: 0, y: 1),
            .init(x: 0, y: 2),
            .init(x: 0, y: 3)
        ])
        
        // ##
        // ##
        static let square = Piece(pixels: [
            .init(x: 0, y: 0),
            .init(x: 0, y: 1),
            .init(x: 1, y: 0),
            .init(x: 1, y: 1)
        ])
    }
    
    func parse(input: Input) -> [Heading.Cardinal] {
        input
            .characters
            .trimming { $0 == "\n" }
            .map { $0 == "<" ? .west : .east }
    }
    
    func pieceCollides(_ piece: Piece, in grid: Set<Point>) -> Bool {
        piece.pixelSet.contains {
            grid.contains($0)
            || $0.x < 0
            || $0.x >= 7
            || $0.y <= 0
        }
    }
    
    func movePiece(_ piece: Piece, heading: Heading.Cardinal, in grid: Set<Point>) -> (piece: Piece, moved: Bool) {
        let pieceBeforeMoving = piece
        
        var piece = piece
        piece.origin = piece.origin.moved(heading)
        
        if pieceCollides(piece, in: grid) {
            return (pieceBeforeMoving, false)
        }
        
        return (piece, true)
    }
    
    func gridHeight(
        jets: [Heading.Cardinal],
        pieceCount: Int
    ) -> Int {
        var grid: Set<Point> = []
        var maxY = 0
        
        let enumeratedPieces = Array(Piece.all.enumerated())
        var jetIterator = LoopingSequence(jets.enumerated()).makeIterator()
                
        let cycleDetector = CycleDetector<InsertedPiece>()
                
        for (pieceOffset, var piece) in enumeratedPieces.cycled().prefix(pieceCount) {
            piece.origin = .init(x: 2, y: maxY + 4)
            
            while let (jetOffset, jet) = jetIterator.next() {
                (piece, _) = movePiece(piece, heading: jet, in: grid)
                
                let moved: Bool
                // Uses north since the grid is inverted so +y is up.
                (piece, moved) = movePiece(piece, heading: .north, in: grid)

                if !moved {
                    let pixels = piece.pixelSet
                    grid.formUnion(pixels)
                    
                    let previousMaxY = maxY
                    maxY = max(maxY, pixels.map(\.y).max()!)
                    
                    cycleDetector.insert(
                        .init(
                            piece: pieceOffset,
                            jet: jetOffset,
                            pieceXPosition: piece.origin.x,
                            beforeHeight: previousMaxY,
                            afterHeight: maxY
                        )
                    )
                    
                    break
                }
            }
            
            if let cycle = cycleDetector.detectedCycle {
                let remainingPieces = pieceCount - cycle.indices.first!
                let (q, r) = remainingPieces.quotientAndRemainder(dividingBy: cycle.count)
                
                // The height before the cycle starts and the height for the partial cycle.
                maxY = cycle[cycle.startIndex.advanced(by: r)].beforeHeight
                
                let cycleHeight = cycle.last!.afterHeight - cycle.first!.beforeHeight
                maxY += cycleHeight * q
                
                break
            }
        }
        
        return maxY
    }
    
    public func part1Solution(for input: Input) -> Int {
        let jets = parse(input: input)
        
        return gridHeight(
            jets: jets,
            pieceCount: 2022
        )
    }
    
    public func part2Solution(for input: Input) -> Int {
        let jets = parse(input: input)
        
        return gridHeight(
            jets: jets,
            pieceCount: 1000000000000
        )
    }
}

struct InsertedPiece: Hashable {
    let piece: Int
    let jet: Int
    let pieceXPosition: Int
    
    let beforeHeight: Int
    let afterHeight: Int

    static func == (lhs: InsertedPiece, rhs: InsertedPiece) -> Bool {
        lhs.piece == rhs.piece
        && lhs.jet == rhs.jet
        && lhs.pieceXPosition == rhs.pieceXPosition
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(piece)
        hasher.combine(jet)
        hasher.combine(pieceXPosition)
    }
}

/// Detects when a cycle occurs in the inserted elements
///
/// Example:
///
/// If the following elements are inserted a cycle will be detected when the last element is
/// inserted. The cycle will be the elements in the first repetition of the elements.
/// ```
/// A, B, C, D, E, F, G, D, E, F, G, D
///                     |----------|
/// ```
///
/// TODO:
/// - Pass a number of cycles that must occur before deciding a cycle exists.
/// - Pass a minimum cycle length so a single repeated element doesn't trigger a cycle.
class CycleDetector<Element: Hashable> {
    private var indexes: [Element: [Int]] = [:]
    private var elements: [Element] = []
    
    private var possibleStartIndex: Int? = nil
    
    typealias Cycle = Array<Element>.SubSequence
    private(set) var detectedCycle: Cycle?
    
    init() {}
    
    @discardableResult
    func insert(_ element: Element) -> Cycle? {
        if let detectedCycle {
           return detectedCycle
        }
        
        let nextIndex = elements.count
        elements.append(element)
        
        defer {
            var elementIndexes = indexes[element] ?? []
            elementIndexes.append(nextIndex)
            indexes[element] = elementIndexes
        }
        
        if let elementIndexes = indexes[element] {
            if let possibleStartIndex {
                if elementIndexes.contains(possibleStartIndex) {
                    let cycle = elements[possibleStartIndex..<nextIndex]
                    detectedCycle = cycle
                    return cycle
                }
            } else {
                possibleStartIndex = nextIndex
            }
        } else {
            possibleStartIndex = nil
        }
        
        return nil
    }
}
