import Foundation

public extension ClosedRange
where Bound: Strideable, Bound.Stride == Int {
    /// Returns a Boolean value indicating whether the given range is continuous with the range.
    ///
    /// A `ClosedRange` instance is continuous with another `ClosedRange` if there are no elements
    /// between the end of one range and the start of another.
    /// - Parameter other: The range to check for continuity.
    /// - Returns: `true` if the ranges are continuous, `false` otherwise.
    func isContinuous(with other: Self) -> Bool {
        upperBound.advanced(by: 1) == other.lowerBound
        || other.upperBound.advanced(by: 1) == lowerBound
    }
}
