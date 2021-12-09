import Foundation

public struct Day8: Day {
    public func part1Solution(for input: Input) -> String {
        part1Solution(for: input, width: 25, height: 6)
    }
    
    func part1Solution(for input: Input, width: Int, height: Int) -> String {
        let layer = input.raw
            .chunked(into: width * height)
            .map { $0.countElements() }
            .max { $0["0", default: 0] > $1["0", default: 0] }!
        
        return "\(layer["1", default: 0] * layer["2", default: 0])"
    }

    public func part2Solution(for input: Input) -> String {
        part2Solution(for: input, width: 25, height: 6)
    }
    
    func part2Solution(for input: Input, width: Int, height: Int) -> String {
        let layers = input.raw
            .chunked(into: width * height)
        
        let flattenedLayer = layers[0].indices
            .compactMap { (index) in
                layers
                    .map { $0[index] }
                    .first { $0 != "2" }
            }
            .map { $0 == "0" ? " " : "█" }
            .chunked(into: width)
            .map { String($0) }
            .joined(separator: "\n")
        
        return flattenedLayer
    }
}
