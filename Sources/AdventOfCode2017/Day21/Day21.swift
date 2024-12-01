import Foundation

public struct Day21: Day {
    var iterations: Int?
    
    private typealias EnhancementRule = (input: Set<PixelGrid>, output: PixelGrid)

    private func parseRules(input: Input) -> [EnhancementRule] {
        return input
            .lines.raw
            .map { $0.components(separatedBy: " => ") }
            .map { (PixelGrid(string: $0[0]).variants(), PixelGrid(string: $0[1])) }
    }

    private func update(grid: PixelGrid, rules: [EnhancementRule], iterations: Int) -> PixelGrid {
        var grid = grid
        
//        print("Start")
    //    print(grid)
        
        for _ in 0..<iterations {
            
            let subgrids = grid.split().map { (subgrid) -> PixelGrid in
                for rule in rules {
                    guard subgrid.matches(rule: rule.input) else { continue }
                    return rule.output
                }
                return subgrid
            }
            
            grid = PixelGrid(joining: subgrids)
            
//            print("Iterations:", i+1)
    //        print(grid)
        }
        
        return grid
    }
    
    func activePixels(iterations: Int, input: Input) -> Int {
        let rules = parseRules(input: input)
        let grid = update(grid: .start, rules: rules, iterations: iterations)
        
        return grid.activePixels
    }
    
    public func part1Solution(for input: Input) -> String {
        return activePixels(iterations: iterations ?? 5, input: input).description
    }

    public func part2Solution(for input: Input) -> String {
        return activePixels(iterations: 18, input: input).description
    }
}

private struct PixelGrid: CustomStringConvertible, Hashable {
    let pixels: [[Bool]]

    static let start = PixelGrid(string: ".#.\n..#\n###")

    var description: String {
        return pixels
            .map { (row) -> String in row.map { $0 ? "#" : "." }.joined() }
            .joined(separator: "\n")
    }
    
    var activePixels: Int {
        return pixels
            .joined()
            .filter { $0 }
            .count
    }
}

extension PixelGrid {
    init(string: String) {
        pixels = string
            .components(separatedBy: CharacterSet(charactersIn: "\n/"))
            .map { row in row.map { $0 == "#" } }
    }

    init(pixels: [Bool]) {
        let size = Int(sqrt(Double(pixels.count)))
        self.pixels = pixels.chunks(ofCount: size).map { Array($0) }
    }
    
    init(joining grids: [PixelGrid]) {
        let size = Int(sqrt(Double(grids.count)))
        let gridSize = grids[0].pixels.count
        
        let temp = grids
            .chunks(ofCount: size)
            .map { (chunk) in
                (0..<gridSize).map { (i) in
                    chunk.flatMap { $0.pixels[i] }
                }
            }.joined()
        self.init(pixels: Array(temp))
    }
    
    func split() -> [PixelGrid] {
        guard pixels.count > 3 else { return [self] }
        
        let subgridSize = (pixels.count % 2 == 0 ? 2 : 3)
        let subgridCount = pixels.count / subgridSize
        
        return (0..<subgridCount).flatMap { (subgridY) in
            (0..<subgridCount).map { (subgridX) -> [[Bool]] in
                let yOffset = subgridY * subgridSize
                let xOffset = subgridX * subgridSize
                
                return (yOffset..<yOffset+subgridSize).map { (y) in
                    (xOffset..<xOffset+subgridSize).map { (x) in
                        pixels[y][x]
                    }
                }
                }.map { PixelGrid(pixels: $0) }
        }
    }
    
    func flipped() -> PixelGrid {
        return PixelGrid(pixels: pixels.reversed())
    }
    
    func mirrored() -> PixelGrid {
        return PixelGrid(pixels: pixels.map { $0.reversed() })
    }
    
    func rotated() -> PixelGrid {
        let size = self.pixels.count
        var pixels: [[Bool]] = Array(repeating: Array(repeating: false, count: size), count: size)
        for x in 0..<size {
            for y in 0..<size {
                pixels[x][y] = self.pixels[y][x]
            }
        }
        
        return PixelGrid(pixels: pixels)
    }
    
    func matches(rule: Set<PixelGrid>) -> Bool {
        return rule.contains(self)
    }
    
    func variants() -> Set<PixelGrid> {
        var variants: Set<PixelGrid> = []
        
        for rotate in [false, true] {
            for mirror in [false, true] {
                for flip in [false, true] {
                    var modified = self
                    modified = rotate ? modified.rotated() : modified
                    modified = mirror ? modified.mirrored() : modified
                    modified = flip ? modified.flipped() : modified
                    variants.insert(modified)
                }
            }
        }
        return variants
    }
}
