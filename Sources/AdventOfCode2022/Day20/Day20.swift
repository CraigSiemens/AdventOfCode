import Algorithms
import Foundation
import Utilities

public struct Day20: Day {
    public func part1Solution(for input: Input) -> Int {
        let values = input.lines.integers
        
        let nodes = CircularList.nodes(from: values)
        
        for node in nodes {
            // Subtract one since remove returns the next node which is +1
            node
                .remove()
                .move(by: node.value - 1)
                .insert(node)
        }
        
        var start = nodes.first { $0.value == 0 }!
        
        start = start.next(by: 1000)
        let v1 = start.value
        
        start = start.next(by: 1000)
        let v2 = start.value
        
        start = start.next(by: 1000)
        let v3 = start.value
        
        return v1 + v2 + v3
    }

    public func part2Solution(for input: Input) -> Int {
        let key = 811589153
        let values = input.lines.integers.map { $0 * key }
        
        let nodes = CircularList.nodes(from: values)
        
        for _ in 1...10 {
            for node in nodes {
                // Subtract one since the node is removed before being moved.
                let move = node.value % (values.count-1)
                
                // Subtract one since remove returns the next node which is +1
                node
                    .remove()
                    .move(by: move - 1)
                    .insert(node)
            }
        }
        
        var start = nodes.first { $0.value == 0 }!
        
        start = start.next(by: 1000)
        let v1 = start.value
        
        start = start.next(by: 1000)
        let v2 = start.value
        
        start = start.next(by: 1000)
        let v3 = start.value
        
        return v1 + v2 + v3
    }
}
