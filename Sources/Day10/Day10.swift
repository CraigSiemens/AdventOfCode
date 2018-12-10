import Foundation
import Utilities

public struct Day10: Day {
    public init() {}
    
    func solution(for input: String) -> (message: String, seconds: Int) {
        let integers = Input(input).lines
            .map {
                $0.raw
                    .components(separatedBy: CharacterSet(charactersIn: "<> ,"))
                    .integers
        }
        
        var positions = integers.map { Point(x: $0[0], y: $0[1]) }
        var velocities = integers.map { Point(x: $0[2], y: $0[3]) }
        
        var lastArea = Int.max
        var seconds = 0
        while true {
            let newPositions = positions.enumerated()
                .map { $0.element + velocities[$0.offset] }
            
            let (min, max) = newPositions.extremes()
            let area = min.area(with: max)
            
            guard area < lastArea else { break }
            positions = newPositions
            lastArea = area
            seconds += 1
        }
        
        let (min, max) = positions.extremes()
        let row = Array(repeating: ".", count: max.x - min.x + 1)
        var output = Array(repeating: row, count: max.y - min.y + 1)
        
        positions.forEach { output[$0.y - min.y][$0.x - min.x] = "#" }
        
        return (output.map { $0.joined() }.joined(separator: "\n"), seconds)
    }
    
    public func part1Solution(for input: String = input) -> String {
        return solution(for: input).message
    }

    public func part2Solution(for input: String = input) -> String {
        return "\(solution(for: input).seconds)"
    }
}
