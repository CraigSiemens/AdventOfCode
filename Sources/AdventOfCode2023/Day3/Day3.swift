import Algorithms
import Foundation
import Utilities

public struct Day3: Day {
    public func part1Solution(for input: Input) -> Int {
        let grid = Grid(input.lines.characters)
        
        let symbolPoints = grid
            .filter { !$0.value.isWholeNumber && $0.value != "." }
            .keys
        
        var total = 0
        
        for symbolPoint in symbolPoints {
            var neighbours = Set(symbolPoint.allNeighbours)
            while let neighbour = neighbours.first {
                neighbours.remove(neighbour)
                
                var cursor = neighbour
                while grid[cursor]?.isWholeNumber == true {
                    cursor = cursor.moved(.west)
                }
                
                guard cursor != neighbour else { continue }
                
                cursor = cursor.moved(.east)
                
                var number = 0
                while let digit = grid[cursor]?.wholeNumberValue {
                    neighbours.remove(cursor)
                    number = number * 10 + digit
                    cursor = cursor.moved(.east)
                }
                
                total += number
            }
        }
        
        return total
    }
    
    public func part2Solution(for input: Input) -> Int {
        let grid = Grid(input.lines.characters)
        
        let gearPoints = grid
            .filter { $0.value == "*" }
            .keys
        
        var total = 0
        
        for gearPoint in gearPoints {
            var neighbours = Set(gearPoint.allNeighbours)
            var numbers: [Int] = []
            
            while let neighbour = neighbours.first {
                neighbours.remove(neighbour)
                
                var cursor = neighbour
                while grid[cursor]?.isWholeNumber == true {
                    cursor = cursor.moved(.west)
                }
                
                guard cursor != neighbour else { continue }
                
                cursor = cursor.moved(.east)
                
                var number = 0
                while let digit = grid[cursor]?.wholeNumberValue {
                    neighbours.remove(cursor)
                    number = number * 10 + digit
                    cursor = cursor.moved(.east)
                }
                
                numbers.append(number)
            }
            
            if numbers.count == 2 {
                total += numbers.product()
            }
        }
        
        return total
    }
}
