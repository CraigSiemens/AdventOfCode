//
//  ExponentialIterator.swift
//  AdventOfCode2018
//
//  Created by Craig Siemens on 2019-01-06.
//

import Foundation

struct ExponentialIterator {
    private var nextValue: UInt
    private var step: UInt = 1
    
    init(value: UInt = 0) {
        self.nextValue = value
    }
    
    mutating public func next() -> UInt? {
        defer {
            nextValue += step
            step <<= 1
        }
        
        return nextValue
    }
}
