import Foundation

public extension Scanner {
    public func nextInt() -> Int? {
        scanUpToCharacters(from: .decimalDigits, into: nil)
        
        var int = 0
        guard scanInt(&int) else { return nil }
        return int
    }
}
