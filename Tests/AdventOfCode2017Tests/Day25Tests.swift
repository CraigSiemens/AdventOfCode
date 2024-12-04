import Testing
@testable import AdventOfCode2017

struct Day25Tests {
    let day = Day25()
    
    let input: Input = """
        Begin in state A.
        Perform a diagnostic checksum after 6 steps.

        In state A:
          If the current value is 0:
            - Write the value 1.
            - Move one slot to the right.
            - Continue with state B.
          If the current value is 1:
            - Write the value 0.
            - Move one slot to the left.
            - Continue with state B.

        In state B:
          If the current value is 0:
            - Write the value 1.
            - Move one slot to the left.
            - Continue with state A.
          If the current value is 1:
            - Write the value 1.
            - Move one slot to the right.
            - Continue with state A.
        """
    
    @Test func part1() {
        #expect(day.part1Solution(for: input) == "3")

//        #expect(day.part1Solution() == "2832")
    }
    
    @Test func part2() {
        #expect(day.part2Solution() == "freebee")
    }
}
