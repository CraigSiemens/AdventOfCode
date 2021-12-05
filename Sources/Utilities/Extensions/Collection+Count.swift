import Foundation

public extension Collection {
    func count(where predicate: (Element) throws -> Bool) rethrows -> Int {
        var count = 0
        for element in self
        where try predicate(element) {
            count += 1
        }
        return count
    }
}
