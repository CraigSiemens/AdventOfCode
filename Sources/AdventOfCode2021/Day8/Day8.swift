import Foundation

public struct Day8: Day {
    public func part1Solution(for input: Input) -> String {
        input
            .lines
            .map { $0.words(by: .init(charactersIn: "|")) }
            .flatMap { $0[1].words }
            .count { [2, 3, 4, 7].contains($0.raw.count) }
            .description
    }

    private func value(forSample sample: [Word], output: [Word]) -> Int {
        let sample = Dictionary(grouping: sample) { $0.raw.count }
        
        var possibleWires = SevenSegment(defaultValue: Set("abcdefg"))
        
        // Apply samples by most restrictive to least restrictive.
        for length in [2, 3, 4, 7, 5, 6] {
            for sample in sample[length, default: []].characters {
                let possibleDigits = SevenSegment.digits
                    .filter { $0.count == sample.count }
                
                for digit in possibleDigits {
                    var segments = possibleWires.segments
                    
                    for index in segments.indices {
                        if digit.segments[index] {
                            segments[index].formIntersection(sample)
                        } else {
                            segments[index].subtract(sample)
                        }
                    }
                    
                    // Don't apply the digit if it causes there to be an empty segment.
                    guard !segments.contains(where: \.isEmpty) else { continue }
                    possibleWires.segments = segments
                }
            }
        }
        
        let digits = output.characters.map { output -> Int in
            let segments = possibleWires.segments
                .map { $0.contains(where: output.contains) }
            return SevenSegment(segments: segments).digit
        }
        
        return Int(digits: digits)
    }
    
    public func part2Solution(for input: Input) -> String {
        input
            .lines
            .map { $0.words(by: .init(charactersIn: "|")).map(\.words) }
            .map { parts -> Int in
                value(forSample: parts[0], output: parts[1])
            }
            .sum()
            .description
    }
}

private struct SevenSegment<Value> {
    var segments: [Value]
}

extension SevenSegment {
    init(defaultValue: Value) {
        self.segments = Array(repeating: defaultValue, count: 7)
    }
}

extension SevenSegment: Equatable where Value: Equatable {}

extension SevenSegment: CustomStringConvertible where Value == Bool {
    static var digits: [Self] {
        [
            .init(segments: [true, true, true, false, true, true, true]),
            .init(segments: [false, false, true, false, false, true, false]),
            .init(segments: [true, false, true, true, true, false, true]),
            .init(segments: [true, false, true, true, false, true, true]),
            .init(segments: [false, true, true, true, false, true, false]),
            .init(segments: [true, true, false, true, false, true, true]),
            .init(segments: [true, true, false, true, true, true, true]),
            .init(segments: [true, false, true, false, false, true, false]),
            .init(segments: [true, true, true, true, true, true, true]),
            .init(segments: [true, true, true, true, false, true, true]),
        ]
    }
    
    var count: Int { segments.count { $0 } }
    var digit: Int { Self.digits.firstIndex(of: self)! }
    
    var description: String { "Digit: \(digit)"}
}
