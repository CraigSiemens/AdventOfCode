import XCTest
@testable import Utilities

final class CloseRangeContinuousTests: XCTestCase {
    func testContains() {
        let range = 1...5
        
        XCTAssertTrue(range.isContinuous(with:6...6))
        XCTAssertTrue(range.isContinuous(with:6...100))
        XCTAssertTrue(range.isContinuous(with:0...0))
        XCTAssertTrue(range.isContinuous(with:-100...0))
        
        XCTAssertFalse(range.isContinuous(with:5...5))
        XCTAssertFalse(range.isContinuous(with:5...100))
        XCTAssertFalse(range.isContinuous(with:1...1))
        XCTAssertFalse(range.isContinuous(with:-100...1))
    }
}
