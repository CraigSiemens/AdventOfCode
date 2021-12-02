import Foundation

public struct LoopingSequence<S: Sequence>: Sequence, IteratorProtocol {
    public typealias Element = S.Element
    private let sequence: S
    private var iterator: S.Iterator?
    
    public init(_ sequence: S) {
        self.sequence = sequence
    }
    
    public mutating func next() -> Element? {
        if let next = iterator?.next() {
            return next
        }
        
        self.iterator = sequence.makeIterator()
        return iterator?.next()
    }
}
