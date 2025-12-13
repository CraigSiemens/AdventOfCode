import Testing
@testable import Utilities

struct ClosedRangeContinuousTests {
    @Test func contains() {
        let range = 1...5
        
        #expect(range.isContinuous(with:6...6) == true)
        #expect(range.isContinuous(with:6...100) == true)
        #expect(range.isContinuous(with:0...0) == true)
        #expect(range.isContinuous(with:-100...0) == true)
        
        #expect(range.isContinuous(with:5...5) == false)
        #expect(range.isContinuous(with:5...100) == false)
        #expect(range.isContinuous(with:1...1) == false)
        #expect(range.isContinuous(with:-100...1) == false)
    }
}
