import Algorithms
import Foundation
import Utilities

public struct Day3: Day {
    private func value(for priority: Character) -> Int {
        if priority.isLowercase {
            return Int(priority.asciiValue! - Character("a").asciiValue! + 1)
        } else {
            return Int(priority.asciiValue! - Character("A").asciiValue! + 27)
        }
    }
    
    public func part1Solution(for input: Input) -> Int {
        input
            .lines
            .map { sack in
                let items = sack.characters
                let priority = items
                    .chunks(ofCount: items.count / 2)
                    .commonElements()
                    .first!
                
                return self.value(for: priority)
            }
            .sum()
    }

    public func part2Solution(for input: Input) -> Int {
        input
            .lines
            .chunks(ofCount: 3)
            .map { sacks in
                let priority = sacks
                    .characters
                    .commonElements()
                    .first!
                
                return self.value(for: priority)
            }
            .sum()
    }
}
