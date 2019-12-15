//
//  Input.swift
//  Utilities
//
//  Created by Craig Siemens on 2018-12-09.
//

import Foundation

public protocol StringInput {
    init(_ raw: String)
    var raw: String { get }
    
    var integer: Int? { get }
    var lines: [Line] { get }
    var words: [Word] { get }
    var characters: [Character] { get }
}

extension StringInput {
    public var integer: Int? {
        return Int(raw)
    }
    
    public var lines: [Line] {
        return raw
            .components(separatedBy: .newlines)
            .map { Line($0) }
    }
    
    public var words: [Word] {
        return raw
            .components(separatedBy: .whitespaces)
            .filter { $0.isEmpty == false }
            .map { Word($0) }
    }
    
    public var characters: [Character] {
        return Array(raw)
    }
}

public struct Input: StringInput {
    public let raw: String
    
    public init(_ raw: String) {
        self.raw = raw//.trimmingCharacters(in: .whitespaces)
    }
}

public struct Line: StringInput {
    public let raw: String
    
    public init(_ raw: String) { self.raw = raw }
}

public struct Word: StringInput {
    public let raw: String
    
    public init(_ raw: String) { self.raw = raw }
}

extension Collection where Element: StringInput {
    public var integers: [Int] {
        return compactMap { $0.integer }
    }
    public var characters: [[Character]] {
        return map { $0.characters }
    }
}

extension Collection where Element: StringProtocol {
    public var integers: [Int] {
        return compactMap { Int($0) }
    }
}

extension Collection where Element == Character {
    public var integers: [Int] {
        return compactMap { Int("\($0)") }
    }
}
