// MARK: - Sequences
extension Tree.Node {
    enum Sequences {}
}

extension Tree.Node.Sequences {
    enum DepthFirst {}
}

// MARK: - DepthFirst
extension Tree.Node.Sequences.DepthFirst {
    struct State {
        let node: Tree.Node<Value>
        var childIndex: Int?
        
        var childNode: Tree.Node<Value>? {
            guard let childIndex,
               node.children.indices.contains(childIndex)
            else {
                return nil
            }
            
            return node.children[childIndex]
        }
    }
    
    struct Pre: Sequence, IteratorProtocol {
        typealias Element = Tree.Node<Value>
        
        private var state: [State]
        
        init(node: Element) {
            self.state = [.init(node: node)]
        }
        
        mutating func next() -> Element? {
//            print(state.map { "\($0.node.value) \($0.childIndex.map { "\($0)" } ?? "nil")" })

            defer { updateState() }
            return state.last?.childNode ?? state.last?.node
        }
        
        private mutating func updateState() {
            guard !state.isEmpty else { return }
            
            var lastState: State {
                get { state.last! }
                set {
                    guard let index = state.indices.last else { return }
                    state[index] = newValue
                }
            }
            
            if let childNode = lastState.childNode {
                // Add the child node to the state
                state.append(
                    .init(
                        node: childNode,
                        childIndex: 0
                    )
                )
            } else {
                // Set the child index for the first node
                lastState.childIndex = 0
            }
            
            // While the current node doesn't have any more children.
            while lastState.childNode == nil {
                // Remove the node from the state
                state.removeLast()
                
                guard !state.isEmpty else { return }
                
                // Move the parent to the next child.
                lastState.childIndex = lastState.childIndex! + 1
            }
        }
    }
    
    struct Post: Sequence, IteratorProtocol {
        typealias Element = Tree.Node<Value>
        
        private var state: [State]
        
        init(node: Element) {
            // Start the stack for getting the first node
            var state = [State(node: node, childIndex: 0)]
            while let node = state.last?.node.children.first {
                state.append(.init(node: node, childIndex: 0))
            }
            
            // Remove the last one since it has no children.
            state.removeLast()
            
            self.state = state
        }
        
        mutating func next() -> Element? {
//            print(state.map { "\($0.node.value) \($0.childIndex.map { "\($0)" } ?? "nil")" })
            
            defer { updateState() }
            return state.last?.childNode ?? state.last?.node
        }
        
        private mutating func updateState() {
            guard !state.isEmpty else { return }

            var lastState: State {
                get { state.last! }
                set {
                    guard let index = state.indices.last else { return }
                    state[index] = newValue
                }
            }
            
            // Return the root node at the end
            guard lastState.childIndex != nil else {
                state.removeLast()
                return
            }
            
            lastState.childIndex = lastState.childIndex! + 1
            while let childNode = lastState.childNode {
                state.append(
                    .init(
                        node: childNode,
                        childIndex: 0
                    )
                )
            }
            
            if state.count == 1 {
                lastState.childIndex = nil
            } else {
                state.removeLast()
            }
        }
    }
}

// MARK: - BreadthFirst
extension Tree.Node.Sequences {
    struct BreadthFirst: Sequence, IteratorProtocol {
        typealias Element = Tree.Node<Value>
        
        private var state: [Element]
        
        init(node: Element) {
            self.state = [node]
        }
        
        mutating func next() -> Element? {
            guard let node = state.first else { return nil }
            
            state.removeFirst()
            state.append(contentsOf: node.children)
            
            return node
        }
    }
}
