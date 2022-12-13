import Foundation

public extension Collection {
    /// Split a collection on a matching element. Removes empty SubSequences by default.
    func split(on separator: (Element) -> Bool, includeEmpty: Bool = true) -> [SubSequence] {
        split(omittingEmptySubsequences: !includeEmpty, whereSeparator: separator)
    }
}
