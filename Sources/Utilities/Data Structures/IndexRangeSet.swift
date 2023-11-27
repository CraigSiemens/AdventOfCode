import Foundation

public struct IndexRangeSet {
    private var ranges: [Element] = []
    
    public init() {}
    
    public mutating func insert(_ range: ClosedRange<Int>) {
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
