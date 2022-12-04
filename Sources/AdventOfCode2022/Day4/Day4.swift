import Algorithms
import Foundation
import Utilities

public struct Day4: Day {
    func parse(input: Input) -> [Pair<ClosedRange<Int>>] {
        input.lines
            .map { line in
                let values = line
                    .words(byCharactersIn: "-,")
                    .integers
                
                return Pair(
                    values[0]...values[1],
                    values[2]...values[3]
                )
            }
    }
    
    public func part1Solution(for input: Input) -> Int {
        parse(input: input)
            .count { pair in
                pair.value { first, second in
                    first.contains(second) || second.contains(first)
                }
            }
    }
    
    public func part2Solution(for input: Input) -> Int {
        parse(input: input)
            .count { pair in
                pair.value { first, second in
                    first.overlaps(second)
                }
            }
    }
}
