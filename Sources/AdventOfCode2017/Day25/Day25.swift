import Foundation

public struct Day25: Day {
    public func part1Solution(for input: Input) -> String {
        enum Direction: String {
            case left, right
            
            var value: Int {
                switch self {
                case .left: return -1
                case .right: return 1
                }
            }
        }

        struct Action {
            let value: Bool
            let direction: Direction
            let state: String
        }

        struct State {
            let name: String
            let actions: [Bool: Action]
            
            init(string: String) {
                let scanner = Scanner(string: string)
                scanner.charactersToBeSkipped = CharacterSet.alphanumerics.inverted
                scanner.scanString("In state", into: nil)
                
                var name: NSString?
                scanner.scanCharacters(from: .letters, into: &name)
                self.name = name! as String
                
                var actions: [Bool: Action] = [:]
                
                while scanner.scanPast("If the current value is") {
                    var value = 0
                    scanner.scanInt(&value)
                    
                    scanner.scanPast("Write the value")
                    var nextValue = 0
                    scanner.scanInt(&nextValue)
                    
                    scanner.scanPast("Move one slot to the")
                    var directionString: NSString?
                    scanner.scanCharacters(from: .letters, into: &directionString)
                    
                    scanner.scanPast("Continue with state")
                    var state: NSString?
                    scanner.scanCharacters(from: .letters, into: &state)

                    actions[value == 1] = Action(value: nextValue == 1,
                                                 direction: Direction(rawValue: directionString! as String)!,
                                                 state: state! as String)
                }
                
                self.actions = actions
            }
        }

        func parseInput(input: Input) -> (String, Int, [State]) {
            let parts = input.raw.components(separatedBy: "\n\n")
            
            let scanner = Scanner(string: parts.first!)
            
            scanner.scanPast("Begin in state")
            var name: NSString?
            scanner.scanCharacters(from: .letters, into: &name)

            scanner.scanPast("Perform a diagnostic checksum after")
            var steps = 0
            scanner.scanInt(&steps)
                
            let states = parts.dropFirst().map { State(string: $0) }
            
            return (name! as String, steps, states)
        }
        
        var (stateName, steps, states) = parseInput(input: input)
        
        var tape = Array(repeating: false, count: steps)
        var index = steps / 2
        
        for _ in 0..<steps {
            let state = states.first { $0.name == stateName }!
            let action = state.actions[tape[index]]!
            
            tape[index] = action.value
            index += action.direction.value
            stateName = action.state
        }
        
        return tape.filter { $0 }.count.description
    }

    public func part2Solution(for input: Input) -> String {
        return "freebee"
    }
}

private extension Scanner {
    @discardableResult func scanPast(_ string: String) -> Bool {
        let upTo = scanUpTo(string, into: nil)
        let past = scanString(string, into: nil)
        return upTo || past
    }
}
