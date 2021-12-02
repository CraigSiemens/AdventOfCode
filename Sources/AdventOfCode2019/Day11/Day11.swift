import Foundation

public struct Day11: Day {
    private func runProgram(_ input: String, map: inout [Point: Color]) {
        let computer = IntcodeComputer()
        computer.load(IntcodeProgram(input))
        computer.run()
        
        var position = Point.zero
        var heading = Heading.north
        while computer.state != .finished {
            computer.input = map[position, default: .black]
            
            guard let color = computer.output,
                let direction = computer.output else { break }
            
            map[position] = color
            heading = heading.turn(direction == 0 ? .left : .right)
            position = position.moved(heading)
        }
    }
    
    public func part1Solution(for input: String = input) -> String {
        var map: [Point: Color] = [:]
        runProgram(input, map: &map)
        return "\(map.count)"
    }

    public func part2Solution(for input: String = input) -> String {
        var map: [Point: Color] = [.zero: .white]
        runProgram(input, map: &map)
        
        let (min, max) = map.keys.extremes()
        let row = Array(repeating: " ", count: max.x - min.x + 1)
        var output = Array(repeating: row, count: max.y - min.y + 1)
        
        map.forEach { output[$0.y - min.y][$0.x - min.x] = $1 == .black ? " " : "█" }
        
        return output.map { $0.joined() }.joined(separator: "\n")
    }
}

private typealias Color = Int
private extension Color {
    static let black = 0
    static let white = 1
}
