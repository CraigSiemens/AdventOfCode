import Foundation

struct Day8: Day {
    struct Node {
        let children: [Node]
        let metadata: [Int]
        
        var metadataSum: Int {
            return metadata.sum()
                + children.map { $0.metadataSum }.sum()
        }
        
        var value: Int {
            if children.isEmpty {
                return metadataSum
            } else {
                return metadata
                    .map { $0 - 1 }
                    .filter { $0 < children.count }
                    .map { children[$0].value }
                    .sum()
            }
        }
        
        init?<I: IteratorProtocol>(input: inout I) where I.Element == Int {
            guard let childCount = input.next(),
                let metadataCount = input.next() else {
                    return nil
            }
            
            children = (0..<childCount).compactMap { _ in Node(input: &input) }
            metadata = (0..<metadataCount).compactMap { _ in input.next() }
        }
    }
    
    public func part1Solution(for input: Input) -> String {
        var iterator = input.words.integers.makeIterator()
        let root = Node(input: &iterator)
        
        return "\(root!.metadataSum)"
    }

    public func part2Solution(for input: Input) -> String {
        var iterator = input.words.integers.makeIterator()
        let root = Node(input: &iterator)
        
        return "\(root!.value)"
    }
}
