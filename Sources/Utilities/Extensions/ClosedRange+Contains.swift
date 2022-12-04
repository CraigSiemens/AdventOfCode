import Foundation

public extension ClosedRange {
    func contains(_ other: Self) -> Bool {
        lowerBound <= other.lowerBound
        && upperBound >= other.upperBound
    }
}
