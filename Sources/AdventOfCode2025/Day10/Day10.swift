import Algorithms
import Foundation
import Utilities

public struct Day10: Day {
    public func part1Solution(for input: Input) -> Int {
        let machines = input.lines.map(Machine.init)
        
        var total = 0
        machineLoop: for machine in machines {
            var states: [Machine.State.Lights] = [.init(machine: machine)]
            var seenStates: Set<[Bool]> = []
            
            while let state = states.popLast() {
                guard seenStates.insert(state.lights).inserted else {
                    continue
                }
                
                for button in machine.buttonWiring.indices
                where !state.pressedButtons.contains(button)
                {
                    var state = state
                    state.pressButton(button)
                    
                    guard !state.isComplete else {
                        total += state.pressedButtons.count
                        continue machineLoop
                    }
                    
                    states.insert(state, at: 0)
                }
            }
        }
        return total
    }
    
    public func part2Solution(for input: Input) -> Int {
        let machines = input.lines.map(Machine.init)
        
        var total = 0
        machineLoop: for machine in machines {
            var states: [Machine.State.Counters] = [.init(machine: machine)]
            var seenStates: [[Int]: Machine.State.Counters] = [:]
            
            print(machine)
            
            while let state = states.popLast() {
                let gcd = state.gcd
                guard seenStates[gcd.counters] == nil else {
                    continue
                }
                seenStates[gcd.counters] = state
                
                let missingGCD = state.missingGCD
                if let missingState = seenStates[missingGCD.counters] {
                    total += state.pressedButtons.count
                    total += missingState.pressedButtons.count * missingGCD.divisor
                    continue machineLoop
                }
                
                for button in machine.buttonWiring.indices {
                    var state = state
                    state.pressButton(button)
                    
                    guard !state.isComplete else {
                        total += state.pressedButtons.count
                        continue machineLoop
                    }
                    
                    guard state.isPossible else {
                        continue
                    }
                    
                    states.insert(state, at: 0)
                }
            }
        }
        return total
    }
    
    private struct Machine {
        let lights: [Bool]
        let buttonWiring: [[Int]]
        let joltage: [Int]
        
        init(line: Line) {
            let words = line.words
            
            self.lights = words.first!.raw
                .dropFirst()
                .dropLast()
                .map { $0 == "#" }
            
            self.buttonWiring = words.dropFirst()
                .dropLast()
                .map { $0.words(byCharactersIn: "(,)").integers }
            
            self.joltage = words.last!
                .words(byCharactersIn: "{,}")
                .integers
        }
        
        enum State {
            struct Lights {
                var lights: [Bool]
                var pressedButtons: [Int] = []
                
                var isComplete: Bool {
                    lights == machine.lights
                }
                
                private let machine: Machine
                
                init(machine: Machine) {
                    self.lights = Array(repeating: false, count: machine.lights.count)
                    self.machine = machine
                }
                
                mutating func pressButton(_ button: Int) {
                    for light in machine.buttonWiring[button] {
                        lights[light].toggle()
                    }
                    pressedButtons.append(button)
                }
            }
            
            struct Counters {
                var counters: [Int]
                var pressedButtons: [Int] = []
                
                var isComplete: Bool {
                    counters == machine.joltage
                }
                
                var gcd: (counters: [Int], divisor: Int) {
                    let divisor = counters.dropFirst()
                        .reduce(counters[0]) { partialResult, next in
                            partialResult.gcd(with: next)
                        }
                    
                    guard divisor > 1 else {
                        return (counters, divisor)
                    }
                    
                    return (counters.map { $0 / divisor}, divisor)
                }
                
                var missingGCD: (counters: [Int], divisor: Int) {
                    let counters = zip(machine.joltage, counters).map(-)
                    let divisor = counters.dropFirst()
                        .reduce(counters[0]) { partialResult, next in
                            partialResult.gcd(with: next)
                        }
                    
                    guard divisor > 1 else {
                        return (counters, divisor)
                    }
                    
                    return (counters.map { $0 / divisor}, divisor)
                }
                
                var isPossible: Bool {
                    zip(machine.joltage, counters).allSatisfy(>=)
                }
                
                private let machine: Machine
                
                init(machine: Machine) {
                    self.counters = Array(repeating: 0, count: machine.lights.count)
                    self.machine = machine
                }
                
                mutating func pressButton(_ button: Int) {
                    for counter in machine.buttonWiring[button] {
                        counters[counter] += 1
                    }
                    pressedButtons.append(button)
                }
            }
        }
    }
}
