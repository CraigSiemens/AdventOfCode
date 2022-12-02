import Foundation

public extension Array {
    subscript(wrappingIndex position: Self.Index) -> Self.Element {
        self[(position + count) % count]
    }
}
