import Foundation

public typealias Graph<Node: Hashable> = [Node: [Node]]

public extension Graph where Value == [Key] {
    typealias Node = Key
    
    func countPaths(from: Node, to: Node) -> Int {
        var pathCounts: [[Node]: Int] = [:]
        
        func _countPaths(from: Node, to: Node) -> Int {
            guard from != to else { return 1 }
            
            let path = [from, to]
            if let count = pathCounts[path] {
                return count
            }
            
            var count = 0
            
            for connectedNode in self[from]! {
                count += _countPaths(from: connectedNode, to: to)
            }
            
            pathCounts[path] = count
            return count
        }
        
        return _countPaths(from: from, to: to)
    }
    
    func countPaths(
        from: Node,
        through: some Collection<Node>,
        to: Node
    ) -> Int {
        var pathCounts: [[Node]: Int] = [:]
        
        func _countPaths(
            from: Node,
            through: some Collection<Node>,
            to: Node
        ) -> Int {
            guard from != to else {
                return 1
            }
            
            var count = 0
            
            if through.isEmpty {
                let path = [from, to]
                if let count = pathCounts[path] {
                    return count
                }
                
                for connectedNode in self[from] ?? [] {
                    count += _countPaths(
                        from: connectedNode,
                        through: [],
                        to: to
                    )
                }
                
                pathCounts[path] = count
            } else {
                for throughNodeOrders in through.permutations(ofCount: through.count) {
                    let throughNode = throughNodeOrders.first!
                    
                    let firstPathCount = _countPaths(
                        from: from,
                        through: [],
                        to: throughNode
                    )
                    
                    guard firstPathCount > 0 else { continue }
                    
                    let remainingPathCount = _countPaths(
                        from: throughNode,
                        through: throughNodeOrders.dropFirst(),
                        to: to
                    )
                    
                    count += firstPathCount * remainingPathCount
                }
            }
            
            return count
        }
        
        return _countPaths(from: from, through: through, to: to)
    }
}
