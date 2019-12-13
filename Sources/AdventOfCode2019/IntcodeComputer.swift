import Foundation

class IntcodeComputer {
    private(set) var state: State = .finished
    private(set) var memory: [Int] = []
    /// The program counter
    private var pc = 0
    
    var input: Int? {
        didSet {
            guard state == .waitingForInput else { return }
            state = .running
            run()
        }
    }
    
    private var _output: Int?
    var output: Int? {
        defer { _output = nil }
        return _output
    }
        
    func load(_ program: IntcodeProgram) {
        state = .loaded
        memory = program.memory
        pc = 0
        input = nil
        _output = nil
    }
    
    func run() {
        if state == .loaded { state = .running }
        
        while state == .running {
            state = .running
            step()
        }
    }
    
    private func value(param: Int, mode: Int) -> Int {
        switch mode {
        case 0: // Position
            return memory[memory[param]]
        case 1: // Immediate
            return memory[param]
        default:
            fatalError("Unknown Parameter Mode")
        }
    }
    
    private func step() {
        let opcode = memory[pc] % 100
        var modes = DigitsSequence(number: memory[pc], isInfinite: true)
            .dropFirst(2)
            .makeIterator()
        
        switch opcode {
        case .addition:
            memory[memory[pc+3]]
                = value(param: pc+1,
                        mode: modes.next()!)
                + value(param: pc+2,
                        mode: modes.next()!)
            pc += 4
        case .multiply:
            memory[memory[pc+3]]
                = value(param: pc+1,
                        mode: modes.next()!)
                * value(param: pc+2,
                        mode: modes.next()!)
            pc += 4
        case .read:
            guard let input = input else {
                state = .waitingForInput
                break
            }
            
            memory[memory[pc+1]] = input
            self.input = nil
            pc += 2
        case .write:
            _output = value(param: pc+1,
                            mode: modes.next()!)
            pc += 2
        case .jumpIfTrue:
            if value(param: pc+1,
                     mode: modes.next()!) != 0 {
                pc = value(param: pc+2,
                           mode: modes.next()!)
            } else {
                pc += 3
            }
        case .jumpIfFalse:
            if value(param: pc+1,
                     mode: modes.next()!) == 0 {
                pc = value(param: pc+2,
                           mode: modes.next()!)
            } else {
                pc += 3
            }
        case .lessThan:
            let v1 = value(param: pc+1,
                           mode: modes.next()!)
            let v2 = value(param: pc+2,
                           mode: modes.next()!)
            
            memory[memory[pc+3]] = v1 < v2 ? 1 : 0
            pc += 4
        case .equals:
            let v1 = value(param: pc+1,
                           mode: modes.next()!)
            let v2 = value(param: pc+2,
                           mode: modes.next()!)
            
            memory[memory[pc+3]] = v1 == v2 ? 1 : 0
            pc += 4
        case .finished:
            state = .finished
        default:
            fatalError("Unknown Intcode")
        }
    }
}

extension IntcodeComputer {
    enum State {
        case loaded
        case running
        case waitingForInput
        case finished
    }
}

extension IntcodeComputer {
    private struct Parameter {
        let mode: Int
        let value: Int
    }
}


private extension Int {
    static let addition = 1
    static let multiply = 2
    static let read = 3
    static let write = 4
    static let jumpIfTrue = 5
    static let jumpIfFalse = 6
    static let lessThan = 7
    static let equals = 8
    
    static let finished = 99
}
