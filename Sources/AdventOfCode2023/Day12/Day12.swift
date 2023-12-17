import Algorithms
import Foundation
import Utilities

public struct Day12: Day {
    public func part1Solution(for input: Input) -> Int {
        input.lines
            .map { line in
                let words = line.words
                
                let statuses = words[0].characters.compactMap(Status.init)
                let damagedRanges = words[1].commaSeparatedWords.integers
                
                return countArrangements(
                    statuses: statuses,
                    damagedRanges: damagedRanges
                )
            }
            .sum()
    }
    
    public func part2Solution(for input: Input) -> Int {
        input.lines
            .map { line in
                let words = line.words
                
                let statuses = words[0].characters.compactMap(Status.init)
                let damagedRanges = words[1].commaSeparatedWords.integers
                
                return countArrangements(
                    statuses: .init(Array(repeating: statuses, count: 5).joined(by: .unknown)),
                    damagedRanges: .init(Array(repeating: damagedRanges, count: 5).joined())
                )
            }
            .sum()
    }
    
    private func countArrangements(
        statuses: [Status],
        damagedRanges: [Int]
    ) -> Int {
        let state = State(
            allStatuses: statuses,
            allDamagedRanges: damagedRanges
        )
        var cache: [State: Int] = [:]
        return countArrangements(state: state, cache: &cache)
    }
    
    private func countArrangements(
        state: State,
        cache: inout [State: Int]
    ) -> Int {
        if let result = cache[state] {
            return result
        }
        
        if state.isComplete {
            return 1
        }
        
        guard let status = state.remainingStatuses.first
        else {
            return 0
        }
        
        var operationalCount = 0
        if status == .operational || status == .unknown,
           state.currentDamagedRange == nil || state.currentDamagedRange == 0 {
            var state = state
            state.remainingStatusesIndex += 1
            state.currentDamagedRange = nil
            
            operationalCount = countArrangements(
                state: state,
                cache: &cache
            )
        }
        
        var damagedCount = 0
        if status == .damaged || status == .unknown {
            var state = state
            
            if state.currentDamagedRange == nil {
                state.currentDamagedRange = state.remainingDamagedRanges.first
                state.remainingDamagedRangesIndex += 1
            }
            
            if let currentDamagedRange = state.currentDamagedRange,
               currentDamagedRange > 0 {
                state.remainingStatusesIndex += 1
                state.currentDamagedRange = currentDamagedRange - 1
                
                damagedCount = countArrangements(
                    state: state,
                    cache: &cache
                )
            }
        }
        
        let count = operationalCount + damagedCount
        cache[state] = count
        return count
    }
}

// MARK: - Types
private enum Status: Character {
    case operational = "."
    case damaged = "#"
    case unknown = "?"
}

private struct State: Hashable {
    let allStatuses: [Status]
    let allDamagedRanges: [Int]
    
    var remainingStatusesIndex: Int = 0
    var remainingDamagedRangesIndex: Int = 0
    var currentDamagedRange: Int? = nil
    
    var isComplete: Bool {
        remainingStatusesIndex == allStatuses.count
        && remainingDamagedRangesIndex == allDamagedRanges.count
        && (currentDamagedRange == 0 || currentDamagedRange == nil)
    }
    
    var remainingStatuses: ArraySlice<Status> {
        allStatuses[remainingStatusesIndex...]
    }
    
    var remainingDamagedRanges: ArraySlice<Int> {
        allDamagedRanges[remainingDamagedRangesIndex...]
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(remainingStatusesIndex)
        hasher.combine(remainingDamagedRangesIndex)
        hasher.combine(currentDamagedRange)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.remainingStatusesIndex == rhs.remainingStatusesIndex
        && lhs.remainingDamagedRangesIndex == rhs.remainingDamagedRangesIndex
        && lhs.currentDamagedRange == rhs.currentDamagedRange
    }
}
