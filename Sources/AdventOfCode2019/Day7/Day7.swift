import Foundation

public struct Day7: Day {
    public let number: Int = 7

    public func part1Solution(for input: String = input) -> String {
        let program = IntcodeProgram(input)
        let computer = IntcodeComputer()
        
        var maxSignal = Int.min
        for phaseSettings in Permutations(from: [0, 1, 2, 3, 4]) {
            var inputSignal = 0

            for phaseSetting in phaseSettings {
                computer.load(program)
                computer.run()
                computer.input = phaseSetting
                computer.input = inputSignal
                inputSignal = computer.output!
                maxSignal = max(maxSignal, inputSignal)
            }
        }
        return "\(maxSignal)"
    }

    public func part2Solution(for input: String = input) -> String {
        let program = IntcodeProgram(input)
        
        var maxSignal = Int.min
        for phaseSettings in Permutations(from: [5, 6, 7, 8, 9]) {
            var inputSignal = 0
            
            let computers = (0..<5).map { (i) -> IntcodeComputer in
                let computer = IntcodeComputer()
                computer.load(program)
                computer.input = phaseSettings[i]
                computer.run()
                return computer
            }
            
            while computers.last?.state != .finished {
                computers[0].input = inputSignal
                computers[1].input = computers[0].output
                computers[2].input = computers[1].output
                computers[3].input = computers[2].output
                computers[4].input = computers[3].output
                inputSignal = computers[4].output!
                
                maxSignal = max(maxSignal, inputSignal)
            }
        }
        return "\(maxSignal)"
    }
}
