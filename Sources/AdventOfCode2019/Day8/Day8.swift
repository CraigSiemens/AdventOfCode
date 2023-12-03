import Foundation

public struct Day8: Day {
    public func part1Solution(for input: Input) -> String {
        part1Solution(for: input, width: 25, height: 6)
    }
    
    func part1Solution(for input: Input, width: Int, height: Int) -> String {
        let layer = input.raw
            .chunks(ofCount: width * height)
            .map { $0.countElements() }
            .max { $0["0", default: 0] > $1["0", default: 0] }!
        
        return "\(layer["1", default: 0] * layer["2", default: 0])"
    }

    public func part2Solution(for input: Input) -> String {
        part2Solution(for: input, width: 25, height: 6)
    }
    
    func part2Solution(for input: Input, width: Int, height: Int) -> String {
        let pixels = input.characters
        let layerPixelCount = width * height
        
        let flattenedLayer = (0..<layerPixelCount)
            .compactMap { index in
                for i in stride(from: index, to: pixels.count, by: layerPixelCount) {
                    if pixels[i] != "2" {
                        return pixels[i]
                    }
                }
                return nil
            }
            .map { $0 == "0" ? " " : "█" }
            .chunks(ofCount: width)
            .map { String($0) }
            .joined(separator: "\n")
        
        return flattenedLayer
    }
}
