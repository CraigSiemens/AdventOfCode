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
    init(tuple: (T, T)) {
        self.init(first: tuple.0, second: tuple.1)
    }
}

extension Pair: Equatable where T: Equatable {}
extension Pair: Hashable where T: Hashable {}
