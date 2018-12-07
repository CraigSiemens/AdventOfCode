//
//  Array+InsertSorted.swift
//  AdventOfCode2018
//
//  Created by Craig Siemens on 2018-12-07.
//

import Foundation

extension Array where Element: Comparable {
    public mutating func sortedInsert(_ newElement: Element, after i: Int = -1) {
        if i < count {
            for i in (i+1..<count) {
                guard self[i] < newElement else {
                    insert(newElement, at: i)
                    return
                }
            }
        }
        append(newElement)
    }
}
