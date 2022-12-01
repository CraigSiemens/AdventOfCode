import Foundation

extension Scanner {
    public func nextInt() -> Int? {
        let set = CharacterSet.decimalDigits.union(CharacterSet(charactersIn: "-"))
        _ = scanUpToCharacters(from: set)
        
        var int = 0
        guard scanInt(&int) else { return nil }
        return int
    }
}
