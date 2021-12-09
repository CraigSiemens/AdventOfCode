import Foundation

struct Day11: Day {

    func value(for serialNumber: Int, x: Int, y: Int) -> Int {
        let rackId = (x + 10)
        return (rackId * y + serialNumber) * rackId / 100 % 10 - 5
    }
    
    // https://en.wikipedia.org/wiki/Summed-area_table
    func summedAreaGrid(for serialNumber: Int) -> [[Int]] {
        var grid = Array(repeating: Array(repeating: 0, count: 301),
                         count: 301)
        
        for y in grid.indices.dropFirst() {
            for x in grid[y].indices.dropFirst() {
                let v = value(for: serialNumber, x: x, y: y)
                grid[y][x] = v + grid[y-1][x] + grid[y][x-1] - grid[y-1][x-1]
            }
        }
        
        return grid
    }
    
    public func part1Solution(for input: Input) -> String {
        let num = input.integer ?? 0
        
        let grid = self.summedAreaGrid(for: num)
        var (maxValue, maxX, maxY) = (0, 0, 0)
        
        for y in grid.indices.dropFirst().dropLast(2) {
            for x in grid[y].indices.dropFirst().dropLast(2) {
//                let value = grid[y][x] - grid[y-2][x] - grid[y][x-2] + grid[y-2][x-2]
                let value = grid[y+2][x+2] - grid[y-1][x+2] - grid[y+2][x-1] + grid[y-1][x-1]

                if value > maxValue {
                    (maxValue, maxX, maxY) = (value, x, y)
                }
            }
        }
        
        return "\(maxX),\(maxY)"
    }

    public func part2Solution(for input: Input) -> String {
        let num = input.integer ?? 0
        
        let grid = self.summedAreaGrid(for: num)
        var (maxValue, maxX, maxY, maxSize) = (0, 0, 0, 0)
        
        for y in grid.indices.dropFirst() {
            for x in grid[y].indices.dropFirst() {
                for size in 0..<(300 - max(x, y)) {
                    let value = grid[y+size][x+size] - grid[y-1][x+size] - grid[y+size][x-1] + grid[y-1][x-1]
                    
                    if value > maxValue {
                        (maxValue, maxX, maxY, maxSize) = (value, x, y, size+1)
                    }
                }
            }
        }
        
        return "\(maxX),\(maxY),\(maxSize)"
    }
}
