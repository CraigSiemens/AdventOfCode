import Foundation

extension Collection {
    public func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            let start = index(startIndex, offsetBy: $0)
            let end = index(startIndex,
                            offsetBy: $0 + size,
                            limitedBy: endIndex)
                ?? endIndex
            return Array(self[start ..< end])
        }
    }
}
