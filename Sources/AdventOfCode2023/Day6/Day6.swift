import Algorithms
import Foundation
import Utilities

public struct Day6: Day {
    public func part1Solution(for input: Input) -> Int {
        let lines = input.lines.map(\.words.integers)
        
        return zip(lines[0], lines[1])
            .map { maxTime, distance in
                (1..<maxTime).count { time in
                    distance < time * (maxTime - time)
                }
            }
            .product()
    }
     
    public func part2Solution(for input: Input) -> Int {
        let lines = input.lines.map { line in
            Line(line.raw.replacingOccurrences(of: " ", with: ""))
                .words(byCharactersIn: ":")
                .integers[0]
        }
        
        let maxTime = Double(lines[0])
        let distance = Double(lines[1])
        
        let lower = (maxTime - sqrt(pow(maxTime, 2) - 4 * distance)) / 2
        let upper = (maxTime + sqrt(pow(maxTime, 2) - 4 * distance)) / 2
        
        return Int(upper.rounded(.down) - lower.rounded(.up)) + 1
    }
}
