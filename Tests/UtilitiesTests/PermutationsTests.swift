import XCTest
@testable import Utilities

final class PermutationsTests: XCTestCase {
    func testPermutations() {
        let permutations = Array(Permutations(from: [1, 2, 3]))
        
        XCTAssertEqual(permutations.count, 6)
        XCTAssertEqual(permutations[0], [1, 2, 3])
        XCTAssertEqual(permutations[1], [2, 1, 3])
        XCTAssertEqual(permutations[2], [3, 1, 2])
        XCTAssertEqual(permutations[3], [1, 3, 2])
        XCTAssertEqual(permutations[4], [2, 3, 1])
        XCTAssertEqual(permutations[5], [3, 2, 1])
    }
}
