import Testing
@testable import Utilities

struct PermutationsTests {
    @Test func permutations() {
        let permutations = Array(Permutations(from: [1, 2, 3]))
        
        #expect(permutations.count == 6)
        #expect(permutations[0] == [1, 2, 3])
        #expect(permutations[1] == [2, 1, 3])
        #expect(permutations[2] == [3, 1, 2])
        #expect(permutations[3] == [1, 3, 2])
        #expect(permutations[4] == [2, 3, 1])
        #expect(permutations[5] == [3, 2, 1])
    }
}
