import Algorithms
import Foundation
import Utilities

public struct Day5: Day {
    private func parseInput(
        _ input: Input
    ) -> (
        updates: [[Int]],
        disallowedPrecedingPages: [Int: Set<Int>]
    ) {
        let parts = input.raw
            .components(separatedBy: "\n\n")
        
        let rulesNumbers = Input(parts[0])
            .lines
            .map { $0.words(by: "|").integers }
        
        let disallowedPrecedingPages = Dictionary(grouping: rulesNumbers) { $0[0] }
            .mapValues { Set($0.map(\.[1])) }
        
        let updates = Input(parts[1])
            .lines
            .map { $0.words(by: ",").integers }
        
        return (updates, disallowedPrecedingPages)
    }
    
    public func part1Solution(for input: Input) -> Int {
        let (updates, disallowedPrecedingPages) = parseInput(input)
        
        var total = 0
        
        for update in updates
        where isValidUpdate(update, disallowedPrecedingPages: disallowedPrecedingPages) {
            total += update[update.count / 2]
        }
        
        return total
    }
    
    public func part2Solution(for input: Input) -> Int {
        let (updates, disallowedPrecedingPages) = parseInput(input)
        
        var total = 0
        
        for update in updates
        where !isValidUpdate(update, disallowedPrecedingPages: disallowedPrecedingPages) {
            var remainingNumbers = Set(update)
            var fixedUpdate: [Int] = []
            
            while !remainingNumbers.isEmpty {
                let number = remainingNumbers.first {
                    let disallowed = disallowedPrecedingPages[$0] ?? []
                    return disallowed.isDisjoint(with: remainingNumbers)
                }!
                remainingNumbers.remove(number)
                fixedUpdate.insert(number, at: 0)
            }
            
            total += fixedUpdate[fixedUpdate.count / 2]
        }
        
        return total
    }
    
    private func isValidUpdate(
        _ update: [Int],
        disallowedPrecedingPages: [Int: Set<Int>]
    ) -> Bool {
        var seenPages: Set<Int> = []
        for page in update {
            let disallowed = disallowedPrecedingPages[page] ?? []
            guard seenPages.isDisjoint(with: disallowed)
            else { return false }
                
            seenPages.insert(page)
        }
        return true
    }
}
