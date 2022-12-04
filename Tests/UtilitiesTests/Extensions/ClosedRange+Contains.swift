import XCTest
@testable import Utilities

final class CloseRangeContainsTests: XCTestCase {
    func testContains() {
        let range = 1...5
        
        XCTAssertTrue(range.contains(1...5))
        XCTAssertTrue(range.contains(1...4))
        XCTAssertTrue(range.contains(2...5))
        XCTAssertTrue(range.contains(3...3))
        
        XCTAssertFalse(range.contains(0...5))
        XCTAssertFalse(range.contains(1...6))
        XCTAssertFalse(range.contains(7...10))
        XCTAssertFalse(range.contains(0...0))
    }
}
