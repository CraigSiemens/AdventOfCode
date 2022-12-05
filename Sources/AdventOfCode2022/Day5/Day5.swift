import Algorithms
import Foundation
import Utilities

public struct Day5: Day {
    struct Instruction {
        var count: Int
        
        var sourceIndex: Int
        var destinationIndex: Int
    }
    
    func parse(input: Input) -> (stacks: [[Character]], instructions: [Instruction]) {
        let parts = input.raw.split(separator: "\n\n").map { Input(String($0)) }
        
        let verticalStacks = parts[0]
            .lines
            .dropLast()
            .map { line in
                line.raw
                    .chunks(ofCount: 4)
                    .map { $0.first(where: CharacterSet.letters.contains) }
            }
        
        var stacks = [[Character]]()
        
        for row in verticalStacks.reversed() {
            for (index, column) in row.enumerated() {
                guard let column else { continue }
                if stacks.count <= index {
                    stacks.append([column])
                } else {
                    stacks[index].append(column)
                }
            }
        }
        
        let instructions = parts[1]
            .lines
            .map {
                let values = $0.words(by: .letters.union(.whitespaces)).integers
                return Instruction(
                    count: values[0],
                    sourceIndex: values[1] - 1,
                    destinationIndex: values[2] - 1
                )
            }

        return (stacks, instructions)
    }
    
    public func part1Solution(for input: Input) -> String {
        var (state, instructions) = parse(input: input)
        
        for instruction in instructions {
            for _ in 0..<instruction.count {
                state[instruction.destinationIndex].append(state[instruction.sourceIndex].popLast()!)
            }
        }
        
        return String(state.map(\.last!))
    }

    public func part2Solution(for input: Input) -> String {
        var (state, instructions) = parse(input: input)
        
        for instruction in instructions {
            state[instruction.destinationIndex].append(
                contentsOf: state[instruction.sourceIndex].suffix(instruction.count)
            )
            state[instruction.sourceIndex].removeLast(instruction.count)
        }
        
        return String(state.map(\.last!))
    }
}
