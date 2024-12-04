import Testing
@testable import Utilities

struct CloseRangeContainsTests {
    @Test func contains() {
        let range = 1...5
        
        #expect(range.contains(1...5) == true)
        #expect(range.contains(1...4) == true)
        #expect(range.contains(2...5) == true)
        #expect(range.contains(3...3) == true)
        
        #expect(range.contains(0...5) == false)
        #expect(range.contains(1...6) == false)
        #expect(range.contains(7...10) == false)
        #expect(range.contains(0...0) == false)
    }
}
