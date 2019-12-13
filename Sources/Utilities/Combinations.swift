//
//  Combinations.swift
//  AdventOfCode2018
//
//  Created by Craig Siemens on 2018-12-02.
//

import Foundation

func factorial(n: Int) -> Int {
    guard n > 1 else {
        return 1
    }
    return n * factorial(n: n-1)
}

public struct Combinations<C: Collection>: Sequence, IteratorProtocol where C.Index == Int {
    let collection: C
    let collectionCount: Int
    var indexes = (0, 0)
//    var sequenceIterator: S.Iterator
    
    public init(from collection: C) {
        self.collection = collection
        self.collectionCount = collection.count
        
//        self.sequenceIterator = sequence.makeIterator()
    }
    
    mutating public func next() -> (C.Element, C.Element)? {
        indexes.1 += 1
        
        if indexes.1 >= collectionCount {
            indexes.0 += 1
            indexes.1 = indexes.0 + 1
        }
        
        guard indexes.0 < collectionCount, indexes.1 < collectionCount else {
            return nil
        }
        
        return (collection[indexes.0], collection[indexes.1])
    }
}
