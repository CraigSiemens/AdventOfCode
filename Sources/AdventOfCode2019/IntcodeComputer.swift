import Foundation

class IntcodeComputer {
    private(set) var state: State = .finished
    
    private var mem: [Int: Int] = [:]
    var memory: [Int] {
        let maxIndex = mem.keys.max() ?? 0
        var memory = Array(repeating: 0, count: maxIndex + 1)
        for i in 0...maxIndex {
            memory[i] = mem[i, default: 0]
        }
        return memory
    }
    
    /// The program counter
    private var pc = 0
    private var relativeBase = 0
    
    var input: Int? {
        didSet {
            guard state == .waitingForInput else { return }
            state = .running
            run()
        }
    }
    
    private(set) var allOutput: [Int] = []
    var output: Int? {
        guard !allOutput.isEmpty else { return nil }
        return allOutput.removeFirst()
    }
        
    func load(_ program: IntcodeProgram) {
        mem.removeAll()
        for (key, value) in program.memory.enumerated() {
            mem[key] = value
        }
        
        state = .loaded
        pc = 0
        relativeBase = 0
        input = nil
        allOutput = []
    }
    
    func run() {
        if state == .loaded { state = .running }
        
        while state == .running {
            state = .running
            step()
        }
    }
    
    private func mode(_ index: Int) -> Int {
        // Offset index by one becuase opcodes are two digits
        let mask = pow(10.0, Double(index + 1))
        return (mem[pc, default: 0] / Int(mask)) % 10
    }

    private subscript(index: Int) -> Int {
        get {
            let value = mem[pc + index, default: 0]
            switch mode(index) {
            case 0: // Position
                return mem[value, default: 0]
            case 1: // Immediate
                return value
            case 2: // Relative Base
                return mem[relativeBase + value, default: 0]
            default:
                fatalError()
            }
        }
        
        set {
            let value = mem[pc + index, default: 0]
            switch mode(index) {
            case 0: // Position
                mem[value] = newValue
            case 1: // Immediate
                fatalError("Can not set in immediate mode")
            case 2: // Relative Base
                mem[relativeBase + value] = newValue
            default:
                fatalError()
            }
        }
    }
    
    private func step() {
        let opcode = mem[pc, default: 0] % 100
        
        switch opcode {
        case .addition:
            self[3] = self[1] + self[2]
            pc += 4
        case .multiply:
            self[3] = self[1] * self[2]
            pc += 4
        case .read:
            guard let input = input else {
                state = .waitingForInput
                break
            }
            
            self[1] = input
            self.input = nil
            pc += 2
        case .write:
            allOutput.append(self[1])
            pc += 2
        case .jumpIfTrue:
            if self[1] != 0 {
                pc = self[2]
            } else {
                pc += 3
            }
        case .jumpIfFalse:
            if self[1] == 0 {
                pc = self[2]
            } else {
                pc += 3
            }
        case .lessThan:
            let v1 = self[1]
            let v2 = self[2]
            
            self[3] = v1 < v2 ? 1 : 0
            pc += 4
        case .equals:
            let v1 = self[1]
            let v2 = self[2]
            
            self[3] = v1 == v2 ? 1 : 0
            pc += 4
        case .adjustRelativeBase:
            relativeBase += self[1]
            pc += 2
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
    static let adjustRelativeBase = 9

    static let finished = 99
}
