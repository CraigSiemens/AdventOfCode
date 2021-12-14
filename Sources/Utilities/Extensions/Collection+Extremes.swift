import Foundation

public extension Collection where Element: Comparable {
    func extremes() -> (min: Element, max: Element) {
        var min = self[startIndex]
        var max = self[startIndex]
        
        for element in dropFirst() {
            min = Swift.min(min, element)
            max = Swift.max(max, element)
        }
        
        return (min, max)
    }
}
