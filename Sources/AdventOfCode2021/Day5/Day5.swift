import Foundation
import Utilities

public struct Day5: Day {
    func parse(input: String) -> [GridLine] {
        Input(input)
            .lines
            .map { line -> GridLine in
                let parts = line.raw
                    .components(separatedBy: .decimalDigits.inverted)
                    .integers
                
                return GridLine(
                    start: .init(x: parts[0], y: parts[1]),
                    end: .init(x: parts[2], y: parts[3])
                )
            }
    }
    
    public func part1Solution(for input: String = input) -> String {
        let lines = parse(input: input)
            .filter { !$0.isDiagonal }
        
        var ventCount = [Point: Int]()
        
        for line in lines {
            for point in line.points {
                ventCount[point, default: 0] += 1
            }
        }
        
        return ventCount.count { $0.value >= 2 }.description
    }

    public func part2Solution(for input: String = input) -> String {
        let lines = parse(input: input)
        
        var ventCount = [Point: Int]()
        
        for line in lines {
            for point in line.points {
                ventCount[point, default: 0] += 1
            }
        }
        
        return ventCount.count { $0.value >= 2 }.description
    }
}
