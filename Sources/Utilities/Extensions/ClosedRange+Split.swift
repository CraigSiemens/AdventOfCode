import Foundation

public extension ClosedRange where Bound == Int {
    /// Splits a range based on the overlap with another range
    /// - Parameter other: The other range to use for splitting.
    /// - Returns: `nil` if the ranges don't overlap. Otherwise it returns a tuple containing the
    ///            range of the overlap and optionally the lower and/or upper remainders that are
    ///            outside the overlapping range.
    func split(by other: Self) -> (overlap: Self, lowerRemainder: Self?, upperRemainder: Self?)? {
        guard overlaps(other) else { return nil }
        
        let lowerRemainder = lowerBound < other.lowerBound
        ? lowerBound...other.lowerBound - 1
        : nil
        
        let upperRemainder = upperBound > other.upperBound
        ? other.upperBound + 1...upperBound
        : nil
        
        return (
            clamped(to: other),
            lowerRemainder,
            upperRemainder
        )
    }
}
