import Foundation

public protocol Day {
    func part1Solution(for input: Input) -> String
    func part2Solution(for input: Input) -> String
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
            let content = try String(contentsOf: file)
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
    
    func part1Solution() -> String {
        return part1Solution(for: Self.input)
    }
    
    func part2Solution() -> String {
        return part2Solution(for: Self.input)
    }
}
