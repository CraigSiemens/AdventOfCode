import Foundation

public struct Day4: Day {
    struct Board: CustomStringConvertible {
        private var values: [[Int?]]
        
        var score: Int?
        
        var description: String {
            values
                .map { line in
                    line.map {
                        if let value = $0 {
                            return "\(value)".padding(toLength: 2, withPad: " ", startingAt: 0)
                        }
                        return "__"
                    }
                    .joined(separator: " ")
                }
                .joined(separator: "\n")
        }
        
        init(_ string: String) {
            values = Input(string).lines.map(\.words.integers)
        }
        
        // Return int of winning score
        mutating func mark(number: Int) -> Int? {
            for y in values.indices {
                for x in values[y].indices
                where values[y][x] == number {
                    values[y][x] = nil
                    
                    guard values.map({ $0[x] }).allSatisfy({ $0 == nil })
                            || values[y].allSatisfy({ $0 == nil })
                    else { return nil }
                    
                    let score = values.joined().compacted().sum() * number
                    self.score = score
                    return score
                }
            }
            
            return nil
        }
    }
    
    public func part1Solution(for input: Input) -> String {
        let parts = input.raw
            .components(separatedBy: "\n\n")
        
        let drawnNumbers = parts[0]
            .components(separatedBy: ",")
            .integers
        
        var boards: [Board] = parts[1...].map(Board.init)
        
        for drawnNumber in drawnNumbers {
            for boardIndex in boards.indices {
                if let score = boards[boardIndex].mark(number: drawnNumber) {
                    return "\(score)"
                }
            }
        }
        
        return "not solved"
    }
    
    public func part2Solution(for input: Input) -> String {
        let parts = input.raw
            .components(separatedBy: "\n\n")
        
        let drawnNumbers = parts[0]
            .components(separatedBy: ",")
            .integers
        
        var boards: [Board] = parts[1...].map(Board.init)
        
        for drawnNumber in drawnNumbers {
            for boardIndex in boards.indices {
                if let score = boards[boardIndex].mark(number: drawnNumber) {
                    if boards.allSatisfy({ $0.score != nil }) {
                        return "\(score)"
                    }
                }
            }
        }
        
        return "not solved"
    }
}
