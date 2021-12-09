import Foundation

public struct Day8: Day {
    struct Instruction {
        enum Operation: String {
            case inc, dec
            
            var function: (Int, Int) -> Int {
                switch self {
                case .inc: return (+)
                case .dec: return (-)
                }
            }
        }
        
        enum ConditionOperation: String {
            case lt = "<", lte = "<=", gt = ">", gte = ">=", eq = "==", neq = "!="
            
            var function: (Int, Int) -> Bool {
                switch self {
                case .lt: return (<)
                case .lte: return (<=)
                case .gt: return (>)
                case .gte: return (>=)
                case .eq: return (==)
                case .neq: return (!=)
                }
            }
        }
        
        struct Condition {
            let register: String
            let operation: ConditionOperation
            let value: Int
            
            init(scanner: Scanner) {
                var r: NSString?
                scanner.scanCharacters(from: .letters, into: &r)
                self.register = r! as String
                
                var op: NSString?
                scanner.scanCharacters(from: CharacterSet(charactersIn: "<>=!"), into: &op)
                self.operation = ConditionOperation(rawValue: op! as String)!
                
                var v: Int = -1
                scanner.scanInt(&v)
                self.value = v
            }
        }
        
        let register: String
        let operation: Operation
        let amount: Int
        
        let condition: Condition
        
        init(string: String) {
            let scanner = Scanner(string: string)
            
            var r: NSString?
            scanner.scanCharacters(from: .letters, into: &r)
            self.register = r! as String
            
            var op: NSString?
            scanner.scanCharacters(from: .letters, into: &op)
            self.operation = Operation(rawValue: op! as String)!
            
            var a: Int = -1
            scanner.scanInt(&a)
            self.amount = a
            
            scanner.scanString("if", into: nil)
            
            condition = Condition(scanner: scanner)
        }
    }

    struct CPU {
        var registers: [String: Int] = [:]
        var maxIntermediateValue: Int = .min
        
        mutating func runInstructions(input: Input) {
            input.lines.raw
                .map { Instruction(string: $0) }
                .forEach { run($0) }
        }
        
        mutating func run(_ instruction: Instruction) {
            let condition = instruction.condition
            guard condition.operation.function(registers[condition.register, default: 0], condition.value) else {
                return
            }
            
            registers[instruction.register] = instruction.operation.function(registers[instruction.register, default: 0], instruction.amount)
            maxIntermediateValue = max(maxIntermediateValue, registers[instruction.register, default: .min])
        }
    }

    func maxFinalRegister(input: Input) -> Int {
        var cpu = CPU()
        cpu.runInstructions(input: input)
        
        return cpu.registers.values.max() ?? -1
    }
    
    public func part1Solution(for input: Input) -> String {
        maxFinalRegister(input: input).description
    }
    
    func maxIntermediateValue(input: Input) -> Int {
        var cpu = CPU()
        cpu.runInstructions(input: input)
        
        return cpu.maxIntermediateValue
    }

    public func part2Solution(for input: Input) -> String {
        maxIntermediateValue(input: input).description
    }
}
