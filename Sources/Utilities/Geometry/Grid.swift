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
    
    init<Input>(_ array: [[Input]], mappingValues: (Point, Input) -> Value) {
        var grid = Grid<Value>()
        
        for y in array.indices {
            for x in array[y].indices {
                let point = Point(x: x, y: y)
                grid[point] = mappingValues(point, array[y][x])
            }
        }
        
        self = grid
    }
    
    func gridString(valueString: (Value?) -> String) -> String {
        let (min, max) = keys.extremes()
        
        var output = ""
        for y in min.y...max.y {
            var line = ""
            for x in min.x...max.x {
                line += valueString(self[.init(x: x, y: y)])
            }
            line.trimSuffix(while: \.isWhitespace)
            
            output += line
            output += "\n"
        }
        return output.trimmingCharacters(in: .newlines)
    }
}

public extension Dictionary where Key == Point, Value: CustomStringConvertible {
    func gridString() -> String {
        gridString {
            $0?.description ?? " "
        }
    }
}
