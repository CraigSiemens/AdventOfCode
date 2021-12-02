import Foundation

/// A sequence over the digits of a number from lowest to highest.
public struct DigitsSequence: Sequence, IteratorProtocol {
    public typealias Element = Int
    
    private var remainder: Int
    private var isInfinite: Bool
    private var isFirst = true
    
    public init(number: Int, isInfinite: Bool = false) {
        self.remainder = number
        self.isInfinite = isInfinite
    }
    
    mutating public func next() -> Int? {
        defer { isFirst = false }
        
        guard isInfinite || remainder != 0 else {
            guard isFirst else { return nil }
            return 0
        }
        
        defer { remainder /= 10 }
        return remainder % 10
    }
}
