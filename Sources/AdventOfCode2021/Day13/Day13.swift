import Foundation
import Utilities

public struct Day13: Day {
    typealias Paper = Set<Point>
    
    enum Fold {
        case x(Int)
        case y(Int)
        
        init(string: String) {
            let parts = string.split(separator: "=")
            if parts[0].hasSuffix("x") {
                self = .x(Int(parts[1])!)
            } else {
                self = .y(Int(parts[1])!)
            }
        }
    }
    
    func parse(input: Input) -> (paper: Paper, folds: [Fold]) {
        let parts = input.words(by: "\n\n")
        
        let points = Input(parts[0].raw)
            .lines
            .map(\.commaSeparatedWords.integers)
            .map { Point(x: $0[0], y: $0[1]) }
        
        let folds = parts[1]
            .lines
            .raw
            .map(Fold.init)
        
        return (Paper(points), folds)
    }
    
    func foldPaper(paper: inout Paper, fold: Fold) {
        let keyPath: WritableKeyPath<Point, Int>
        let foldLocation: Int
        
        switch fold {
        case let .x(value):
            keyPath = \.x
            foldLocation = value
        case let .y(value):
            keyPath = \.y
            foldLocation = value
        }
        
        let foldedPoints = paper
            .filter { $0[keyPath: keyPath] > foldLocation }
        
        for var foldedPoint in foldedPoints {
            paper.remove(foldedPoint)
            foldedPoint[keyPath: keyPath] = foldLocation
                - (foldedPoint[keyPath: keyPath] - foldLocation)
            paper.insert(foldedPoint)
        }
    }
    
    public func part1Solution(for input: Input) -> String {
        var (paper, folds) = parse(input: input)
        
        foldPaper(paper: &paper, fold: folds[0])
        
        return paper.count.description
    }

    public func part2Solution(for input: Input) -> String {
        var (paper, folds) = parse(input: input)
        
        for fold in folds {
            foldPaper(paper: &paper, fold: fold)
        }
        
        let string = paper.gridString()
        return string.matchingLetters() ?? string
    }
}
