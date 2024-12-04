import Testing
@testable import Utilities

struct TreeTests {
    @Test func allParents() {
        let root = Tree.Node(value: 0)
        let a = Tree.Node(value: 1)
        let b = Tree.Node(value: 2)
        
        root.addChild(a)
        a.addChild(b)
        
        #expect(root.allParents == [])
        #expect(a.allParents == [root])
        #expect(b.allParents == [a, root])
    }
    
    @Test func sequenceDepthFirstPre() {
        let root = Tree.Node(value: 0, children: [
            .init(value: 1, children: [
                .init(value: 2),
                .init(value: 3)
            ]),
            .init(value: 4, children: [
                .init(value: 5, children: [
                    .init(value: 6)
                ]),
                .init(value: 7)
            ]),
            .init(value: 8)
        ])
        
        let values = root.sequence(order: .depthFirst(.pre)).map(\.value)
        
        #expect(values == [0, 1, 2, 3, 4, 5, 6, 7, 8])
    }
    
    @Test func sequenceDepthFirstPost() {
        let root = Tree.Node(value: 8, children: [
            .init(value: 2, children: [
                .init(value: 0),
                .init(value: 1)
            ]),
            .init(value: 6, children: [
                .init(value: 4, children: [
                    .init(value: 3)
                ]),
                .init(value: 5)
            ]),
            .init(value: 7)
        ])
        
        let values = root.sequence(order: .depthFirst(.post)).map(\.value)
        
        #expect(values == [0, 1, 2, 3, 4, 5, 6, 7, 8])
    }
    
    @Test func sequenceBreadthFirst() {
        let root = Tree.Node(value: 0, children: [
            .init(value: 1, children: [
                .init(value: 4),
                .init(value: 5)
            ]),
            .init(value: 2, children: [
                .init(value: 6, children: [
                    .init(value: 8)
                ]),
                .init(value: 7)
            ]),
            .init(value: 3)
        ])
        
        let values = root.sequence(order: .breadthFirst).map(\.value)
        
        #expect(values == [0, 1, 2, 3, 4, 5, 6, 7, 8])
    }
}
