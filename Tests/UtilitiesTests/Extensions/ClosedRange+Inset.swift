import Testing
@testable import Utilities

struct ClosedRangeInsetTests {
    @Test func inset() async {
        let range = 1...5
        
        #expect(range.inset(0) == 1...5)
        #expect(range.inset(1) == 2...4)
        #expect(range.inset(2) == 3...3)
        #expect(range.inset(-1) == 0...6)
        
        await #expect(processExitsWith: .failure) {
            let range = 1...1
            _ = range.inset(1)
        }
        
        await #expect(processExitsWith: .failure) {
            let range = 1...3
            _ = range.inset(2)
        }
    }
}
