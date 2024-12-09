import Algorithms
import Foundation
import Utilities

public struct Day7: Day {
    public func part1Solution(for input: Input) -> Int {
        solution(
            for: input,
            operators: [(*), (+)]
        )
    }
    
    public func part2Solution(for input: Input) -> Int {
        solution(
            for: input,
            operators: [concatenate, (*), (+)]
        )
    }
    
    private func solution(for input: Input, operators: [(Int, Int) -> Int]) -> Int {
        input.lines
            .map { $0.words(byCharactersIn: ": ").integers }
            .filter {
                values(
                    $0.dropFirst(2),
                    partialValue: $0[1],
                    canEqual: $0[0],
                    withOperators: operators
                )
            }
            .map { $0[0] }
            .sum()
    }
    
    private func values(
        _ remainingValues: ArraySlice<Int>,
        partialValue: Int,
        canEqual result: Int,
        withOperators operators: [(Int, Int) -> Int]
    ) -> Bool {
        guard partialValue <= result
        else { return false }
        
        guard let nextValue = remainingValues.first
        else { return partialValue == result }
        
        for op in operators {
            let result = values(
                remainingValues.dropFirst(),
                partialValue: op(partialValue, nextValue),
                canEqual: result,
                withOperators: operators
            )
            guard !result else { return true }
        }
        return false
    }
    
    private func concatenate(lhs: Int, rhs: Int) -> Int {
        var multiplier = 10
        while multiplier <= rhs {
            multiplier *= 10
        }
        return lhs * multiplier + rhs
    }
}
