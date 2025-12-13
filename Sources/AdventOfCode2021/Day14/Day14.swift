import Foundation

public struct Day14: Day {
    func run(for input: Input, steps: Int) -> Int {
        let parts = input.words(by: "\n\n")
        
        var countedPairs = Dictionary(
            counting: parts[0].characters.adjacentPairs().map(Pair.init)
        )
        
        let substitutions = Dictionary(
            uniqueKeysWithValues: Input(parts[1].raw)
                .lines
                .map { $0.words(by: " -> ").raw }
                .map { (Pair($0[0].first!, $0[0].last!), $0[1].first!) }
        )

        for _ in 0..<steps {
            var nextPairs = Dictionary<Pair<Character>, Int>()
            
            for (pair, count) in countedPairs {
                let insert = substitutions[pair]!
                
                nextPairs[Pair(pair.first, insert), default: 0] += count
                nextPairs[Pair(insert, pair.second), default: 0] += count
            }

            countedPairs = nextPairs
        }
        
        
        var counts = Dictionary<Character, Int>()
        for (key, value) in countedPairs {
            counts[key.first, default: 0] += value
            counts[key.second, default: 0] += value
        }
        
        // Add an extra one for the first and last characters since
        // they aren't double counted.
        counts[parts[0].first!, default: 0] += 1
        counts[parts[0].last!, default: 0] += 1
        
        // Divider every countcoulnt by two since each character is in two pairs.
        counts = counts.mapValues { $0 / 2 }
        
        let extremes = counts.values.extremes()
        return extremes.max - extremes.min
    }
    
    public func part1Solution(for input: Input) -> String {
        return run(for: input, steps: 10).description
    }

    public func part2Solution(for input: Input) -> String {
        return run(for: input, steps: 40).description
    }
}
