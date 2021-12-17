import Foundation

public extension Int {
    /// Also known as a triangular sum
    /// 1 + 2 + ... + self
    var gaussSum: Int {
        self * (self + 1) / 2
    }
}
