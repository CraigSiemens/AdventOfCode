import Foundation

public struct Day9: Day {
    public func part1Solution(for input: Input) -> String {
        var groupLevel = 0
        var score = 0
        
        var garbage = false
        var ignoreNext = false
        
        for character in input.characters {
            guard !ignoreNext else {
                ignoreNext = false
                continue
            }
            
            switch character {
            case "{" where !garbage:
                groupLevel += 1
            case "}" where !garbage:
                score += groupLevel
                groupLevel -= 1
            case "!":
                ignoreNext = true
            case "<":
                garbage = true
            case ">":
                garbage = false
            default: break
            }
        }
        
        return score.description
    }

    public func part2Solution(for input: Input) -> String {
        var garbageCount = 0
        
        var garbage = false
        var ignoreNext = false
        
        for character in input.characters {
            guard !ignoreNext else {
                ignoreNext = false
                continue
            }
            
            switch character {
            case "!":
                ignoreNext = true
            case "<" where !garbage:
                garbage = true
            case ">":
                garbage = false
            default:
                if garbage {
                    garbageCount += 1
                }
            }
        }
        
        return garbageCount.description
    }
}
