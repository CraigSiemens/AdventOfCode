import Foundation

public extension Collection where Element: Hashable {
    var allUnique: Bool {
        Set(self).count == count
    }
}
