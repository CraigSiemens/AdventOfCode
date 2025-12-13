import Foundation

public extension ClosedRange where Bound == Int {
    func inset(_ amount: Bound) -> Self {
        (lowerBound + amount)...(upperBound - amount)
    }
}
