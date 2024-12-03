import Algorithms
import Foundation
import Utilities
import RegexBuilder

public struct Day3: Day {
    let mulRegex = Regex {
        "mul("
        Capture {
            OneOrMore(.digit)
        } transform: { Int($0)! }
        ","
        Capture {
            OneOrMore(.digit)
        } transform: { Int($0)! }
        ")"
    }
    
    public func part1Solution(for input: Input) -> Int {
        var total = 0
        for match in input.raw.matches(of: mulRegex) {
            total += match.1 * match.2
        }
        return total
    }
    
    public func part2Solution(for input: Input) -> Int {
        let regex = Regex {
            ChoiceOf {
                mulRegex
                "don't()"
                "do()"
            }
        }
        
        var enabled = true
        
        var total = 0
        for match in input.raw.matches(of: regex) {
            if match.0 == "do()" {
                enabled = true
            } else if match.0 == "don't()" {
                enabled = false
            } else if enabled {
                total += match.1! * match.2!
            }
        }
        return total
    }
}
