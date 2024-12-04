import Testing
@testable import Utilities

struct DigitsSequenceTests {
    
    @Test func finiteSequence() {
        #expect(Array(DigitsSequence(number: 0)) == [0])
        #expect(Array(DigitsSequence(number: 1)) == [1])
        #expect(Array(DigitsSequence(number: 1000)) == [0, 0, 0, 1])
        #expect(Array(DigitsSequence(number: 1234)) == [4, 3, 2, 1])
    }
    
    @Test func infiniteSequence() {
        #expect(Array(DigitsSequence(number: 0, isInfinite: true).prefix(5)) == [0, 0, 0, 0, 0])
        #expect(Array(DigitsSequence(number: 1, isInfinite: true).prefix(5)) == [1, 0, 0, 0, 0])
        #expect(Array(DigitsSequence(number: 1000, isInfinite: true).prefix(5)) == [0, 0, 0, 1, 0])
        #expect(Array(DigitsSequence(number: 1234, isInfinite: true).prefix(5)) == [4, 3, 2, 1, 0])
    }
}
