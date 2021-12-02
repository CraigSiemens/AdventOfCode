import Foundation

public protocol HasInput {
    static var input: String { get }
}

public protocol Day {    
    func part1Solution(for input: String) -> String
    func part2Solution(for input: String) -> String
}

public extension Day {
    var number: Int {
        String(describing: type(of: self))
            .replacingOccurrences(of: "Day", with: "")
            .int!
    }
}

public typealias SolvableDay = Day & HasInput
extension Day where Self: HasInput {
    public func part1Solution() -> String {
        return part1Solution(for: Self.input)
    }
    
    public func part2Solution() -> String {
        return part2Solution(for: Self.input)
    }
}
