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
        private var next: Node<T>!
        private var previous: Node<T>!
        
        public init(_ value: T) {
            self.value = value
            next = self
            previous = self
        }
        
        public func insert(_ value: T) -> Node<T> {
            let node = Node(value)
            
            node.next = self.next
            next.previous = node
            
            next = node
            node.previous = self
            
            return node
        }
        
        public func remove() -> Node<T> {
            previous.next = next
            next.previous = previous
            
            return next
        }
        
        public func next(by amount: Int) -> Node<T> {
            return (0..<amount).reduce(self) { (c, _) in c.next }
        }
        
        public func previous(by amount: Int) -> Node<T> {
            return (0..<amount).reduce(self) { (c, _) in c.previous }
        }
    }
}
