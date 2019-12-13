import XCTest
@testable import Utilities

final class CollectionChunkTests: XCTestCase {
    func testChunked() {
        let a = [1, 2, 3, 4, 5, 6]
        XCTAssertEqual(a.chunked(into: 2), [[1, 2], [3, 4], [5, 6]])
        XCTAssertEqual(a.chunked(into: 3), [[1, 2, 3], [4, 5, 6]])
    }
}

