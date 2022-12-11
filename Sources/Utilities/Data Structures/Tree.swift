import Foundation

public enum Tree {
    public class Node<Value> {
        public weak var parent: Node<Value>?
        public private(set) var children: [Node<Value>]
        
        public var value: Value
        
        public init(value: Value, children: [Node<Value>] = []) {
            self.value = value
            self.children = children
        }
        
        public func addChild(_ child: Node<Value>) {
            child.parent = self
            self.children.append(child)
        }
    }
}

// MARK: - Equatable
extension Tree.Node: Equatable where Value: Equatable {
    public static func == (lhs: Tree.Node<Value>, rhs: Tree.Node<Value>) -> Bool {
        lhs.value == rhs.value
    }
}

// MARK: - allParents
extension Tree.Node {
    public var allParents: [Tree.Node<Value>] {
        var parents: [Tree.Node<Value>] = []
        
        var parent = self.parent
        while let node = parent {
            parents.append(node)
            parent = node.parent
        }
        
        return parents
    }
}

// MARK: - CustomDebugStringConvertible
extension Tree.Node: CustomDebugStringConvertible {
    public var debugDescription: String { "\(value)" }
}

// MARK: - sequence(order:)
public extension Tree.Node {
    enum SequenceOrder {
        case depthFirst(DepthFirst)
        case breadthFirst
        
        public enum DepthFirst {
            /// Visit a node before its children
            case pre
            /// Visit a node after its children
            case post
        }
    }
    
    func sequence(order: SequenceOrder) -> any Sequence<Tree.Node<Value>> {
        switch order {
        case .depthFirst(.pre):
            return Sequences.DepthFirst.Pre(node: self)
        case .depthFirst(.post):
            return Sequences.DepthFirst.Post(node: self)
        case .breadthFirst:
            return Sequences.BreadthFirst(node: self)
        }
    }
}
