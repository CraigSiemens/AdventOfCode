//
//  Box.swift
//  AdventOfCode2018
//
//  Created by Craig Siemens on 2018-12-07.
//

import Foundation

public class Box<T> {
    public var value: T
    public init(value: T) {
        self.value = value
    }
}

extension Box: Equatable where T: Equatable {
    public static func == (lhs: Box<T>, rhs: Box<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

extension Box: Hashable where T: Hashable {
    public func hash(into hasher: inout Hasher) {
        value.hash(into: &hasher)
    }
}
