import Foundation

public typealias Grid<Value> = [Point: Value]

public extension Dictionary where Key == Point {
    init(_ array: [[Value]]) {
        var grid = Grid<Value>()
        
        for y in array.indices {
            for x in array[y].indices {
                grid[Point(x: x, y: y)] = array[y][x]
            }
        }
        
        self = grid
    }
}
