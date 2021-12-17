import Foundation
import Utilities

public struct Day17: Day {
    public func part1Solution(for input: Input) -> String {
        let parts = input
            .words(by: CharacterSet.decimalDigits.union(.init(charactersIn: "-")).inverted)
            .integers
        
        let y = -parts[2] - 1
        
        return y.gaussSum.description
    }

    public func part2Solution(for input: Input) -> String {
        let parts = input
            .words(by: CharacterSet.decimalDigits.union(.init(charactersIn: "-")).inverted)
            .integers
        
        let xRange = parts[0]...parts[1]
        let yRange = parts[2]...parts[3]
        
        var hits = 0
        
        for y in yRange.lowerBound...(-yRange.lowerBound - 1) {
            for x in 0...xRange.upperBound {
                var velocity = Point(x: x, y: y)
                var point = velocity
                
                while point.x <= xRange.upperBound, point.y >= yRange.lowerBound {
                    if xRange.contains(point.x), yRange.contains(point.y) {
                        hits += 1
                        break
                    }
                    
                    velocity.x -= velocity.x.signum()
                    velocity.y -= 1
                    
                    point += velocity
                }
            }
        }
        
        return hits.description
    }
}
