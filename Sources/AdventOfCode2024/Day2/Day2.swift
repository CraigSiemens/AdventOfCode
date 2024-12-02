import Algorithms
import Foundation
import Utilities

public struct Day2: Day {
    public func part1Solution(for input: Input) -> Int {
        input.lines
            .map(\.words.integers)
            .count(where: isSafe)
    }
    
    public func part2Solution(for input: Input) -> Int {
        input.lines
            .map(\.words.integers)
            .count { isSafe(report: $0) || isSafeWithBadValue(report: $0) }
    }
    
    private func isSafe(report: [Int]) -> Bool {
        let diffs = zip(report, report.dropFirst()).map { $0 - $1 }
        return Set(diffs.map { $0.signum() }).count == 1
           && diffs.allSatisfy({ 1...3 ~= abs($0) })
    }
    
    private func isSafeWithBadValue(report: [Int]) -> Bool {
        for i in report.indices {
            var newReport = report
            newReport.remove(at: i)
            if isSafe(report: newReport) {
                return true
            }
        }
        
        return false
    }
}
