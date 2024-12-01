import Foundation

public protocol Day {
    associatedtype Part1Solution: CustomStringConvertible = String
    associatedtype Part2Solution: CustomStringConvertible = String
    
    func part1Solution(for input: Input) -> Part1Solution
    func part2Solution(for input: Input) -> Part2Solution
}

public extension Day {
    static var input: Input {
        let parts = String(reflecting: self)
            .components(separatedBy: ".")
        
        let file = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent() // Day.swift
            .deletingLastPathComponent() // Core
            .deletingLastPathComponent() // Utilities
            .appendingPathComponent(parts[0])
            .appendingPathComponent(parts[1])
            .appendingPathComponent("input.txt")
        
        do {
            let content = try String(contentsOf: file, encoding: .utf8)
            return Input(content)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    var number: Int {
        String(describing: type(of: self))
            .replacingOccurrences(of: "Day", with: "")
            .int!
    }
    
    func part1Solution() -> Part1Solution {
        return part1Solution(for: Self.input)
    }
    
    func part2Solution() -> Part2Solution {
        return part2Solution(for: Self.input)
    }
}
