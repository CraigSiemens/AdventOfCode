//
//  Day.swift
//  AdventOfCode2018
//
//  Created by Craig Siemens on 2018-12-04.
//

import Foundation

public protocol HasInput {
    static var input: String { get }
}

public protocol Day {
    init()
    func part1Solution(for input: String) -> String
    func part2Solution(for input: String) -> String
}

extension Day where Self: HasInput {
    public func part1Solution() -> String {
        return part1Solution(for: Self.input)
    }
    
    public func part2Solution() -> String {
        return part2Solution(for: Self.input)
    }
}
