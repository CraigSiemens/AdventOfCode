import Algorithms
import Foundation
import Utilities

public struct Day13: Day {
    public func part1Solution(for input: Input) -> Int {
        input
            .words(by: "\n\n")
            .map { part in
                let grid = Grid(part.lines.characters)
                let range = grid.keys.pointRange()
                
            mirror:
                for mirrorOffset in range.x.dropFirst() {
                    for (x, y) in product(mirrorOffset...range.x.upperBound, range.y) {
                        let point = Point(x: x, y: y)
                        let reflectedPoint = Point(x: 2 * mirrorOffset - x - 1, y: y)
                        
                        guard let reflectedValue = grid[reflectedPoint]
                        else { break }
                        
                        guard grid[point] == reflectedValue
                        else { continue mirror }
                    }
                    return mirrorOffset
                }
                
            mirror:
                for mirrorOffset in range.y.dropFirst() {
                    for (y, x) in product(mirrorOffset...range.y.upperBound, range.x) {
                        let point = Point(x: x, y: y)
                        let reflectedPoint = Point(x: x, y: 2 * mirrorOffset - y - 1)
                        
                        guard let reflectedValue = grid[reflectedPoint]
                        else { break }
                        
                        guard grid[point] == reflectedValue
                        else { continue mirror }
                    }
                    return mirrorOffset * 100
                }
                
                return 0
            }
            .sum()
    }
    
    public func part2Solution(for input: Input) -> Int {
        input
            .words(by: "\n\n")
            .map { part in
                let grid = Grid(part.lines.characters)
                let range = grid.keys.pointRange()
                
            mirror:
                for mirrorOffset in range.x.dropFirst() {
                    var hasSmudge = false
                    for (x, y) in product(mirrorOffset...range.x.upperBound, range.y) {
                        let point = Point(x: x, y: y)
                        let reflectedPoint = Point(x: 2 * mirrorOffset - x - 1, y: y)
                        
                        guard let reflectedValue = grid[reflectedPoint]
                        else { break }
                        
                        if grid[point] != reflectedValue {
                            if hasSmudge {
                                continue mirror
                            }
                            hasSmudge = true
                        }
                    }
                    
                    if hasSmudge {
                        return mirrorOffset
                    }
                }
                
            mirror:
                for mirrorOffset in range.y.dropFirst() {
                    var hasSmudge = false
                    for (y, x) in product(mirrorOffset...range.y.upperBound, range.x) {
                        let point = Point(x: x, y: y)
                        let reflectedPoint = Point(x: x, y: 2 * mirrorOffset - y - 1)
                        
                        guard let reflectedValue = grid[reflectedPoint]
                        else { break }
                        
                        if grid[point] != reflectedValue {
                            if hasSmudge {
                                continue mirror
                            }
                            hasSmudge = true
                        }
                    }
                    
                    if hasSmudge {
                        return mirrorOffset * 100
                    }
                }
                
                return 0
            }
            .sum()
    }
}
