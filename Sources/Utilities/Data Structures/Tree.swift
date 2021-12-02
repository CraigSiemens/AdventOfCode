import Foundation

public enum Tree {
    public class Node<T> {
        public weak var parent: Node<T>?
        public var children: [Node<T>] = []
        
        public let value: T
        
        public init(value: T) {
            self.value = value
        }
        
        public func addChild(_ child: Node<T>) {
            child.parent = self
            self.children.append(child)
        }
    }
}

extension Tree.Node: Equatable where T: Equatable {
    public static func == (lhs: Tree.Node<T>, rhs: Tree.Node<T>) -> Bool {
        lhs.value == rhs.value
    }
}

extension Tree.Node {
    public var allParents: [Tree.Node<T>] {
        var parents: [Tree.Node<T>] = []
        
        var parent = self.parent
        while let node = parent {
            parents.append(node)
            parent = node.parent
        }
        
        return parents
    }
}

extension Tree.Node: CustomDebugStringConvertible {
    public var debugDescription: String { "\(value)" }
}
