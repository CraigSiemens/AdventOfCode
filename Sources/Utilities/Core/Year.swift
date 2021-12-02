import Foundation

public protocol Year {
    var days: [SolvableDay] { get }
}

public extension Year {
    var number: Int {
        String(describing: type(of: self))
            .replacingOccurrences(of: "AdventOfCode", with: "")
            .int!
    }
}
