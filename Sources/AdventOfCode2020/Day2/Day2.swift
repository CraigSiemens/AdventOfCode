import Foundation

public struct Day2: Day {
    public let number: Int = 2

    struct ParsedLine {
        let numbers: [Int]
        let character: Character
        let string: String
    }
    
    private func parseInput(for input: String) -> [ParsedLine] {
        return Input(input)
            .lines
            .map { (line) -> ParsedLine in
                let parts = line.raw
                    .split(separator: " ")
                                
                return ParsedLine(numbers: parts[0].split(separator: "-").integers,
                                  character: parts[1].first!,
                                  string: String(parts[2]))
            }
    }
    
    public func part1Solution(for input: String = input) -> String {
        let valid = parseInput(for: input)
            .filter { (line) -> Bool in
                let range = line.numbers[0]...line.numbers[1]
                let count = line.string.countElements()[line.character] ?? 0
                
                return range.contains(count)
            }
        
        return "\(valid.count)"
    }

    public func part2Solution(for input: String = input) -> String {
        let valid = parseInput(for: input)
            .filter { (line) -> Bool in
                line.numbers
                    .map { line.string.index(line.string.startIndex, offsetBy: $0 - 1) }
                    .map { line.string[$0] == line.character }
                    .reduce(false, !=)
            }
        
        return "\(valid.count)"
    }
}
