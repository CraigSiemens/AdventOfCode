import XCTest
@testable import Utilities

final class DigitsSequenceTests: XCTestCase {
    
    func testFiniteSequence() {
        XCTAssertEqual(Array(DigitsSequence(number: 0)), [0])
        XCTAssertEqual(Array(DigitsSequence(number: 1)), [1])
        XCTAssertEqual(Array(DigitsSequence(number: 1000)), [0, 0, 0, 1])
        XCTAssertEqual(Array(DigitsSequence(number: 1234)), [4, 3, 2, 1])
    }
    
    func testInfiniteSequence() {
        XCTAssertEqual(Array(DigitsSequence(number: 0, isInfinite: true).prefix(5)), [0, 0, 0, 0, 0])
        XCTAssertEqual(Array(DigitsSequence(number: 1, isInfinite: true).prefix(5)), [1, 0, 0, 0, 0])
        XCTAssertEqual(Array(DigitsSequence(number: 1000, isInfinite: true).prefix(5)), [0, 0, 0, 1, 0])
        XCTAssertEqual(Array(DigitsSequence(number: 1234, isInfinite: true).prefix(5)), [4, 3, 2, 1, 0])
    }
}
