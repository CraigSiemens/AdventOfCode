import XCTest
@testable import Utilities

final class LoopingSequenceTests: XCTestCase {
    func testLoopingLoopingSequence() {
        XCTAssertEqual(Array(LoopingSequence([1,2,3]).prefix(7)),
                       [1,2,3,1,2,3,1])
    }
}
