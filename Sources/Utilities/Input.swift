//
//  Input.swift
//  Utilities
//
//  Created by Craig Siemens on 2018-12-09.
//

import protocol Combine.TopLevelDecoder
import Foundation

public protocol RawConvertible {
    associatedtype Raw
    var raw: Raw { get }
}

public protocol StringInput: Hashable, Comparable, RawConvertible, ExpressibleByStringLiteral {
    init(_ raw: String)
    var raw: String { get }
    
    var integer: Int? { get }
    var lines: [Line] { get }
    var words: [Word] { get }
    var commaSeparatedWords: [Word] { get }
    var characters: [Character] { get }
}

extension StringInput {
    init<S: StringProtocol>(_ raw: S) {
        self.init(.init(raw))
    }
    
    public var integer: Int? {
        return Int(raw)
    }
    
    public var lines: [Line] {
        return raw
            .components(separatedBy: .newlines)
            .map { Line($0) }
    }
    
    public var words: [Word] {
        return words(by: .whitespaces)
    }
    
    public var commaSeparatedWords: [Word] {
        return words(by: ",")
    }
    
    public func words(by split: CharacterSet) -> [Word] {
        return raw
            .components(separatedBy: split)
            .filter { $0.isEmpty == false }
            .map { Word($0) }
    }
    
    public func words(byCharactersIn split: String) -> [Word] {
        return words(by: CharacterSet(charactersIn: split))
    }
    
    public func words(by split: String) -> [Word] {
        return raw
            .components(separatedBy: split)
            .filter { $0.isEmpty == false }
            .map { Word($0) }
    }
    
    public var characters: [Character] {
        return Array(raw)
    }
    
    public subscript<T>(dynamicMember keyPath: KeyPath<String, T>) -> T {
        raw[keyPath: keyPath]
    }
    
    public subscript(i: String.Index) -> Character {
        raw[i]
    }
    
    public subscript<R>(r: R) -> String.SubSequence
    where R : RangeExpression, String.Index == R.Bound {
        raw[r]
    }
    
    public func decode<Item>(type: Item.Type) throws -> Item
    where Item: Decodable {
        let decoder = JSONDecoder()
        
        return try decoder.decode(type, from: Data(raw.utf8))
    }
}

// Comparable
extension StringInput {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.raw < rhs.raw
    }
}

// ExpressibleByStringLiteral
extension StringInput {
    public init(stringLiteral value: String) {
        self.init(value)
    }
}

@dynamicMemberLookup
public struct Input: StringInput {
    public let raw: String
    
    public init(_ raw: String) {
        self.raw = raw.trimmingCharacters(in: .newlines)
    }
}

@dynamicMemberLookup
public struct Line: StringInput {
    public let raw: String
    
    public init(_ raw: String) { self.raw = raw }
}

@dynamicMemberLookup
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
        return compactMap(\.wholeNumberValue)
    }
    
    public var bits: [Bool] {
        return map { $0 == "1" }
    }
    
    public var hexBits: [Bool] {
        return compactMap { Int("\($0)", radix: 16) }
            .flatMap { $0.bits(minLength: 4) }
    }
}

extension String {
    public var int: Int? {
        return Int(self)
    }
}

extension Array: RawConvertible where Element: RawConvertible {
    public var raw: [Element.Raw] {
        map(\.raw)
    }
}
