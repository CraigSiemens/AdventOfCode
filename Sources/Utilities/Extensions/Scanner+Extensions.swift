import Foundation

extension Scanner {
    public func nextInt() -> Int? {
        let set = CharacterSet.decimalDigits.union(CharacterSet(charactersIn: "-"))
        scanUpToCharacters(from: set, into: nil)
        
        var int = 0
        guard scanInt(&int) else { return nil }
        return int
    }
}
