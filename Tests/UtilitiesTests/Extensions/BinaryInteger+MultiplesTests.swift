import XCTest
@testable import Utilities

final class BinaryIntegerMultiplesTests: XCTestCase {
    func testGCD() {
        XCTAssertEqual(8.gcd(with: 12), 4)
        XCTAssertEqual(0.gcd(with: 9), 9)
        XCTAssertEqual(9.gcd(with: 0), 9)
        XCTAssertEqual(0.gcd(with: 0), 0)
    }
    
    func testLCM() {
        XCTAssertEqual(8.lcm(with: 12), 24)
        XCTAssertEqual(2.lcm(with: 9), 18)
        XCTAssertEqual(9.lcm(with: 2), 18)
        XCTAssertEqual(0.lcm(with: 9), 0)
        XCTAssertEqual(0.lcm(with: 0), 0)
    }
}
