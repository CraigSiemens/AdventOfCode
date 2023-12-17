import Foundation

public struct IndexRangeSet {
    private var ranges: [Element] = []
    
    public init() {}
    
    public init(ranges: [Element]) {
        for range in ranges {
            insert(range)
        }
    }
    
    public mutating func insert(_ value: Element.Bound) {
        insert(value...value)
    }
    
    public mutating func insert(_ range: Element) {
        var range = range
        
        for i in ranges.indices.reversed()
        where ranges[i].overlaps(range) || ranges[i].isContinuous(with: range) {
            let lowerBound = Swift.min(range.lowerBound, ranges[i].lowerBound)
            let upperBound = Swift.max(range.upperBound, ranges[i].upperBound)
            range = lowerBound...upperBound
            
            ranges.remove(at: i)
        }
        
        ranges.append(range)
    }
    
    public mutating func remove(_ value: Element.Bound) {
        remove(value...value)
    }
    
    public mutating func remove(_ range: Element) {
        var newRanges: [Element] = []
        
        for i in ranges.indices.reversed() {
            guard let (_, lower, upper) = ranges[i].split(by: range)
            else { continue}
            
            if let lower {
                newRanges.append(lower)
            }
            
            if let upper {
                newRanges.append(upper)
            }
            
            ranges.remove(at: i)
        }
        
        ranges.append(contentsOf: newRanges)
    }
}

extension IndexRangeSet: Collection {
    public typealias Index = Int
    public typealias Element = ClosedRange<Int>
    
    public var startIndex: Index { ranges.startIndex }
    public var endIndex: Index { ranges.endIndex }
    
    public subscript(position: Index) -> Element {
        ranges[position]
    }
    
    public func index(after i: Index) -> Index {
        ranges.index(after: i)
    }
}
