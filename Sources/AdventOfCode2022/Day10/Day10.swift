import Algorithms
import Foundation
import Utilities

public struct Day10: Day {
    public func part1Solution(for input: Input) -> Int {
        var cycle = 1
        var x = 1
        var total = 0
        func nextCycle() {
            cycle += 1
            
            if (cycle - 20).isMultiple(of: 40) {
                total += (cycle * x)
            }
        }
        
        for words in input.lines.map(\.words) {
            switch words[0] {
            case "noop":
                nextCycle()
            case "addx":
                nextCycle()
                x += words[1].int!
                nextCycle()
            default:
                fatalError()
            }
        }
        
        return total
    }

    public func part2Solution(for input: Input) -> String {
        var cycle = 0
        var xRegister = 1
        
        var grid = Grid<Character>()
        
        func nextCycle() {
            let (y, x) = cycle.quotientAndRemainder(dividingBy: 40)
            
            if abs(xRegister - x) <= 1 {
                grid[Point(x: x, y: y)] = "#"
            }
            
            cycle += 1
        }
        
        for words in input.lines.map(\.words) {
            switch words[0] {
            case "noop":
                nextCycle()
            case "addx":
                nextCycle()
                nextCycle()
                xRegister += words[1].int!
            default:
                fatalError()
            }
        }
        
        let gridString = grid.gridString()
        return gridString.matchingLetters() ?? gridString
    }
}
