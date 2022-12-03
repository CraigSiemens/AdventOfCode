import Foundation

public extension Collection where Element: Collection, Element.Element: Hashable {
    func commonElements() -> Set<Element.Element> {
        var result = Set(first!)
        
        for element in dropFirst() {
            result.formIntersection(element)
        }
        
        return result
    }
}
