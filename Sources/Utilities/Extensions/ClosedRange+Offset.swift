import Foundation

public extension ClosedRange where Bound == Int {
    func offset(_ amount: Bound) -> Self {
        (lowerBound + amount)...(upperBound + amount)
    }
}
