import Foundation

extension Collection where Element: Numeric {
    public func product() -> Element {
        return reduce(1, *)
    }
}
