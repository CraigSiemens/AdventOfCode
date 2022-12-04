import Foundation

extension Sequence {
    public var pairs: [Pair<Element>] {
        zip(self, self.dropFirst()).map { Pair(tuple: $0) }
    }
}

public struct Pair<T> {
    public let first: T
    public let second: T
}

extension Pair {
    public init(_ first: T, _ second: T) {
        self.init(first: first, second: second)
    }
    
    public init(tuple: (T, T)) {
        self.init(first: tuple.0, second: tuple.1)
    }
}

extension Pair: Equatable where T: Equatable {}
extension Pair: Hashable where T: Hashable {}

// MARK: - Value Methods
public extension Pair {
    /// Generate a new value from the content of the `Pair`.
    /// - Parameter closure: A closure that will be passed the first and second values.
    /// - Returns: The value from the closure.
    func value<R>(_ closure: (_ first: T, _ second: T) -> R) -> R {
        closure(first, second)
    }

    /// Generate a new value from the content of the Pair.
    /// - Parameter closure: A closure that will be passed the first value, then the second value.
    /// Allows passing in instance methods on `T`. ie. Could be passed `Int.isMultiple.`
    /// - Returns: The value from the closure.
    func value<R>(_ closure: (T) -> (T) -> R) -> R {
        closure(first)(second)
    }
}
