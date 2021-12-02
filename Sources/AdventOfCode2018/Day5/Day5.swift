import Foundation

struct Day5: Day {
    func indexToRemove(in input: String, matching inverted: String, offset: Int) -> String.Index? {
        return zip(input.indices.dropFirst(offset), inverted.dropFirst(offset + 1))
            .first(where: { input[$0] == $1})?
            .0
    }
    
    func reduce(polymer input: String) -> String {
        var output = input
        
        let invertedCharacters = zip(input, zip(input.lowercased(), input.uppercased()))
            .map { $0 == $1.0 ? $1.1 : $1.0 }
        var inverted = String(invertedCharacters)
        
        var lastOffset = 0
        while let index = indexToRemove(in: output, matching: inverted, offset: lastOffset) {
            let range = index...output.index(after: index)
            lastOffset = max(0, output.distance(from: output.startIndex, to: index) - 1)
            
            output.removeSubrange(range)
            inverted.removeSubrange(range)
        }
        
        return output
    }
    
    public func part1Solution(for input: String = input) -> String {
        return "\(reduce(polymer: input).count)"
    }

    public func part2Solution(for input: String = input) -> String {
        let prereduced = reduce(polymer: input)
        
        return Set(prereduced.lowercased())
            .map { prereduced.replacingOccurrences(of: "\($0)", with: "", options: .caseInsensitive) }
            .map { reduce(polymer: $0).count }
            .min()
            .flatMap { "\($0)" }
            ?? "UNKNOWN"
    }
}
