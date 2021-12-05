import Foundation

public struct Day6: Day {
    public func part1Solution(for input: String = input) -> String {
        var memory = input.split(whereSeparator: CharacterSet.whitespaces.contains).compactMap { Int($0) }
        
        var seenStates: Set<String> = []
        while !seenStates.contains(memory.description) {
            seenStates.insert(memory.description)
            
            guard let (maxIndex, maxValue) = memory.enumerated().max(by: { $0.element < $1.element }) else {
                return "-1"
            }
            
            memory[maxIndex] = 0
            for i in 1...maxValue {
                memory[(maxIndex + i) % memory.count] += 1
            }
        }
        
        return seenStates.count.description
    }
    
    struct State: Hashable {
        let memory: String
        let index: Int
        
        static func == (lhs: State, rhs: State) -> Bool {
            return lhs.memory == rhs.memory
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(memory)
        }
    }
    
    public func part2Solution(for input: String = input) -> String {
        var memory = input.split(whereSeparator: CharacterSet.whitespaces.contains).compactMap { Int($0) }
        
        var seenStates: Set<State> = []
        while !seenStates.contains(State(memory: memory.description, index: seenStates.count)) {
            seenStates.insert(State(memory: memory.description, index: seenStates.count))
            
            guard let (maxIndex, maxValue) = memory.enumerated().max(by: { $0.element < $1.element }) else {
                return "-1"
            }
            
            memory[maxIndex] = 0
            for i in 1...maxValue {
                memory[(maxIndex + i) % memory.count] += 1
            }
        }
        
        let currentState = State(memory: memory.description, index: seenStates.count)
        let firstState = seenStates.remove(currentState)
        
        return "\(seenStates.count - firstState!.index + 1)"
    }
}
