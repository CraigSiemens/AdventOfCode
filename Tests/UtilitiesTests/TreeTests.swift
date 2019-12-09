import XCTest
@testable import Utilities

final class TreeTests: XCTestCase {
    func testAllParents() {
        let root = Tree.Node(value: 0)
        let a = Tree.Node(value: 1)
        let b = Tree.Node(value: 2)
        
        root.addChild(a)
        a.addChild(b)
        
        XCTAssertEqual(root.allParents, [])
        XCTAssertEqual(a.allParents, [root])
        XCTAssertEqual(b.allParents, [a, root])
    }
}
