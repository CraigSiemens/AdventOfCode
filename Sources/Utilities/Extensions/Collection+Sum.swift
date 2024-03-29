import Foundation

extension Collection where Element: Numeric {
    public func sum() -> Element {
        return reduce(0, +)
    }
}
