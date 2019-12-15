import XCTest
@testable import Utilities

final class BinaryIntegerMultiplesTests: XCTestCase {
    func testGCD() {
        XCTAssertEqual(8.gcd(with: 12), 4)
        XCTAssertEqual(0.gcd(with: 9), 9)
        XCTAssertEqual(9.gcd(with: 0), 9)
        XCTAssertEqual(0.gcd(with: 0), 0)
    }
}

