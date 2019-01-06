//
//  ExponentialSearchIterator.swift
//  AdventOfCode2018
//
//  Created by Craig Siemens on 2019-01-06.
//

import Foundation

public struct ExponentialSearchIterator: IteratorProtocol {
    private var state: State
    
    enum State {
        case exponential(ExponentialIterator, ClosedRange<UInt>)
        case binary(BinarySearchIterator)
    }
    
    public init(value: UInt = 0) {
        state = .exponential(ExponentialIterator(value: UInt(value)), 0...0)
    }
    
    public mutating func next() -> UInt? {
        switch state {
        case .exponential(var iterator, let range):
            let nextValue = iterator.next()!
            state = .exponential(iterator, (range.upperBound+1)...nextValue)
            return nextValue
        case .binary(var iterator):
            defer { state = .binary(iterator) }
            return iterator.next()
        }
    }
    
    public mutating func toggleDirection() {
        switch state {
        case .exponential(_, let range):
            var iterator = BinarySearchIterator(range: range)
            iterator.toggleDirection()
            state = .binary(iterator)
        case .binary(var iterator):
            iterator.toggleDirection()
            state = .binary(iterator)
        }
    }
}
