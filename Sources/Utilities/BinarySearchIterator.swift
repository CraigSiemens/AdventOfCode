//
//  BinarySearchIterator.swift
//  AdventOfCode2018
//
//  Created by Craig Siemens on 2019-01-06.
//

import Foundation

struct BinarySearchIterator: IteratorProtocol {
    var value: UInt
    
    private var first = true
    private var possibleRange: ClosedRange<UInt>
    private var direction = Direction.increment
    private var isFinished = false
    
    enum Direction {
        case increment, decrement
        mutating func toggle() {
            self = (self == .increment ? .decrement : .increment)
        }
    }
    
    init(range: ClosedRange<UInt>) {
        value = (range.upperBound - range.lowerBound) / 2 + range.lowerBound
        possibleRange = range
    }
    
    mutating public func next() -> UInt? {
        guard !isFinished, possibleRange.count > 1 else { return nil }
        
        guard !first else {
            first = false
            return value
        }
        
        switch direction {
        case .increment:
            guard (value + 1) <= possibleRange.upperBound else {
                isFinished = true
                return nil
            }
            possibleRange = (value + 1)...possibleRange.upperBound
        case .decrement:
            guard possibleRange.lowerBound <= (value - 1) else {
                isFinished = true
                return nil
            }
            possibleRange = possibleRange.lowerBound...(value - 1)
        }
        
        value = (possibleRange.upperBound - possibleRange.lowerBound) / 2 + possibleRange.lowerBound
        return value
    }
    
    public mutating func toggleDirection() {
        guard !isFinished else { return }
        direction.toggle()
    }
}
