import Algorithms
import Foundation
import Utilities

public struct Day8: Day {
    public func part1Solution(for input: Input) -> Int {
        let parts = input.words(by: "\n\n")
        
        let instructions = parts[0].characters
        
        let map = parts[1]
            .lines
            .map { line in
                line.words(by: CharacterSet.alphanumerics.inverted)
                    .map(\.raw)
            }
            .keyed { $0[0] }
            .mapValues { (left: $0[1], right: $0[2]) }
        
        var index = 0
        var count = 0
        var location = "AAA"
        let end = "ZZZ"
        
        while location != end {
            let instruction = instructions[index]
            if instruction == "L" {
                location = map[location]!.left
            } else if instruction == "R" {
                location = map[location]!.right
            } else {
                fatalError("impossible")
            }
            
            index = (index + 1) % instructions.count
            count += 1
        }
        
        return count
    }
    
    public func part2Solution(for input: Input) -> Int {
        let parts = input.words(by: "\n\n")
        
        let instructions = parts[0].characters
        
        let map = parts[1]
            .lines
            .map { line in
                line.words(by: CharacterSet.alphanumerics.inverted)
                    .map(\.raw)
            }
            .keyed { $0[0] }
            .mapValues { (left: $0[1], right: $0[2]) }
        
        return map.keys
            .filter { $0.hasSuffix("A") }
            .map { start in
                var index = 0
                var count = 0
                var location = start
                
                while !location.hasSuffix("Z") {
                    let instruction = instructions[index]
                    if instruction == "L" {
                        location = map[location]!.left
                    } else if instruction == "R" {
                        location = map[location]!.right
                    } else {
                        fatalError("impossible")
                    }
                    
                    index = (index + 1) % instructions.count
                    count += 1
                }
                
                return count
            }
            .reduce(1) { $0.lcm(with: $1) }
    }
}
