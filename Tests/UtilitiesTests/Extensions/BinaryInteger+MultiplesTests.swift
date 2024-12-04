import Testing
@testable import Utilities

struct BinaryIntegerMultiplesTests {
    @Test func gcd() {
        #expect(8.gcd(with: 12) == 4)
        #expect(0.gcd(with: 9) == 9)
        #expect(9.gcd(with: 0) == 9)
        #expect(0.gcd(with: 0) == 0)
    }
    
    @Test func lcm() {
        #expect(8.lcm(with: 12) == 24)
        #expect(2.lcm(with: 9) == 18)
        #expect(9.lcm(with: 2) == 18)
        #expect(0.lcm(with: 9) == 0)
        #expect(0.lcm(with: 0) == 0)
    }
}
