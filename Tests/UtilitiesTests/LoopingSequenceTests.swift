import Testing
@testable import Utilities

struct LoopingSequenceTests {
    @Test func loopingLoopingSequence() {
        #expect(Array(LoopingSequence([1,2,3]).prefix(7)) == [1,2,3,1,2,3,1])
    }
}
