//
//  CircularList.swift
//  AdventOfCode2018
//
//  Created by Craig Siemens on 2018-12-09.
//

import Foundation

public enum CircularList {
    public class Node<T> {
        public let value: T
        private var nextNode: Node<T>!
        private var previousNode: Node<T>!
        
        public init(_ value: T) {
            self.value = value
            nextNode = self
            previousNode = self
        }
        
        /// Inserts a value after the current node
        /// - Parameter value: The value to insert
        /// - Returns: The inserted node
        public func insert(_ value: T) -> Node<T> {
            let node = Node(value)
            insert(node)
            return node
        }
        
        public func insert(_ node: Node) {
            node.nextNode = self.nextNode
            nextNode.previousNode = node
            
            nextNode = node
            node.previousNode = self
        }
        
        /// Removes this node from the list
        /// - Returns: The next node in the list
        public func remove() -> Node<T> {
            previousNode.nextNode = nextNode
            nextNode.previousNode = previousNode
            
            defer {
                previousNode = self
                nextNode = self
            }
            
            return nextNode
        }
        
        public func next(by amount: Int) -> Node<T> {
            var node = self
            for _ in 0..<amount {
                node = node.nextNode
            }
            return node
        }
        
        public func previous(by amount: Int) -> Node<T> {
            var node = self
            for _ in 0..<amount {
                node = node.previousNode
            }
            return node
        }
        
        public func move(by amount: Int) -> Node<T> {
            if amount > 0 {
                return next(by: amount)
            } else {
                return previous(by: -amount)
            }
        }
    }
}

public extension CircularList {
    static func nodes<T>(from sequence: some Sequence<T>) -> [Node<T>] {
        var nodes: [Node<T>] = []
        
        for element in sequence {
            if let last = nodes.last {
                nodes.append(last.insert(element))
            } else {
                nodes.append(.init(element))
            }
        }
        
        return nodes
    }
}

extension CircularList.Node: Sequence {
    public typealias Element = CircularList.Node<T>
    
    public func makeIterator() -> UnfoldFirstSequence<Element> {
        sequence(first: self) { $0.next(by: 1) }
    }
}

extension CircularList.Node: CustomDebugStringConvertible {
    public var debugDescription: String {
        "Node(value: \(String(describing: value)))"
    }
}
