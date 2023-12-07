import Algorithms
import Foundation
import Utilities

public struct Day5: Day {
    struct Mapping {
        let from: ClosedRange<Int>
        let offset: Int
        
        init(_ array: [Int]) {
            from = array[1]...array[1]+array[2]-1
            offset = array[0] - array[1]
        }
    }
    
    public func part1Solution(for input: Input) -> Int {
        let parts = input.words(by: "\n\n")
        
        let almanac = parts.dropFirst()
            .map { part in
                part.lines
                    .dropFirst()
                    .map(\.words.integers)
                    .map(Mapping.init)
            }
        
        return parts[0].words.integers
            .map { seed in
                almanac.reduce(seed) { value, mappings in
                    for mapping in mappings
                    where mapping.from.contains(value) {
                        return value + mapping.offset
                    }
                    return value
                }
            }
            .min()!
    }
    
    public func part2Solution(for input: Input) -> Int {
        let parts = input.words(by: "\n\n")
        
        let almanac = parts.dropFirst()
            .map { part in
                part.lines
                    .dropFirst()
                    .map(\.words.integers)
                    .map(Mapping.init)
            }
        
        let seedRanges = parts[0].words.integers
            .chunks(ofCount: 2)
            .map { $0.first!...$0.first!+$0.last!-1 }
        
        func minValue(for ranges: [ClosedRange<Int>], almanac: some Collection<[Mapping]>) -> Int {
            ranges
                .map { minValue(for: $0, almanac: almanac) }
                .min()!
        }
        
        func minValue(for range: ClosedRange<Int>, almanac: some Collection<[Mapping]>) -> Int {
            guard let mappings = almanac.first else {
                return range.lowerBound
            }
            
            let almanac = almanac.dropFirst()
            
            var mappedRanges: [ClosedRange<Int>] = []
            var ranges: Set = [range]
            outer: while let range = ranges.first {
                ranges.remove(range)
                
                for mapping in mappings {
                    guard let split = range.split(by: mapping.from) else { continue }
                    
                    mappedRanges.append(split.overlap.offset(mapping.offset))
                    _ = split.lowerRemainder.map { ranges.insert($0) }
                    _ = split.upperRemainder.map { ranges.insert($0) }
                    continue outer
                }
                
                mappedRanges.append(range)
            }
            
            return minValue(for: mappedRanges, almanac: almanac)
        }
        
        return minValue(for: seedRanges, almanac: almanac)
    }
}

private extension ClosedRange where Bound == Int {
    func offset(_ amount: Bound) -> Self {
        (lowerBound + amount)...(upperBound + amount)
    }
    
    func split(by other: Self) -> (overlap: Self, lowerRemainder: Self?, upperRemainder: Self?)? {
        guard overlaps(other) else { return nil }
        
        let lowerRemainder = lowerBound < other.lowerBound
        ? lowerBound...other.lowerBound - 1
        : nil
        
        let upperRemainder = upperBound > other.upperBound
        ? other.upperBound + 1...upperBound
        : nil
        
        return (
            clamped(to: other),
            lowerRemainder,
            upperRemainder
        )
    }
}
