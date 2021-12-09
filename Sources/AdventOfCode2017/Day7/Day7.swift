import Foundation

public struct Day7: Day {
    class Program {
        let name: String
        var weight: Int = -1
        var subprograms: [Program] = []
        var parent: Program?
        
        private var savedTotalWeight: Int?
        var totalWeight: Int {
            let totalWeight = savedTotalWeight
                ?? subprograms.map { $0.totalWeight }.reduce(0, +) + weight
            savedTotalWeight = totalWeight
            return totalWeight
        }
        
        init(name: String) {
            self.name = name
        }
        
        func requiredWeightForUnbalancedProgram() -> Int? {
            if let weight = subprograms.compactMap({ $0.requiredWeightForUnbalancedProgram() }).first {
                return weight
            }
            
            var weightCounts: [Int: [Program]] = [:]
            subprograms.forEach { weightCounts[$0.totalWeight, default: []].append($0) }
            guard weightCounts.count > 1 else { return nil }
            
            let sortedWeights = weightCounts.sorted { $0.1.count < $1.1.count }
            guard let first = sortedWeights.first?.key,
                let offbalanceProgram = sortedWeights.first?.value.first,
                let second = sortedWeights.last?.key else {
                    return nil
            }
            
            return offbalanceProgram.weight - (first - second)
        }
        
        func recursivePrint(level: Int = 0) {
            let indent: String
            if level > 0 {
                indent = String(repeating: "  ", count: level - 1) + " |"
            } else {
                indent = ""
            }
            print("\(indent)\(name) \(weight) \(totalWeight)")
            subprograms.forEach { $0.recursivePrint(level: level + 1) }
        }
    }

    func createProgram(line: String, programsByName: [String: Program]) -> Program {
        let scanner = Scanner(string: line)
        
        var scannedName: NSString?
        scanner.scanCharacters(from: .letters, into: &scannedName)
        guard let name = scannedName as String? else { fatalError() }
        
        let program = programsByName[name] ?? Program(name: name)
        
        guard scanner.scanUpToCharacters(from: .decimalDigits, into: nil),
            scanner.scanInt(&program.weight) else {
                return program
        }
        
        var subprogramName: NSString?
        while scanner.scanUpToCharacters(from: .letters, into: nil),
            scanner.scanCharacters(from: .letters, into: &subprogramName),
            let subprogramName = subprogramName as String? {
                let subprogram = programsByName[subprogramName] ?? Program(name: subprogramName)
                program.subprograms.append(subprogram)
                subprogram.parent = program
        }
        
        return program
    }

    func buildTree(input: Input) -> Program {
        var programsByName: [String: Program] = [:]
        
        input
            .lines
            .forEach { (line) in
                let program = createProgram(line: line.raw, programsByName: programsByName)
                programsByName[program.name] = program
                program.subprograms.forEach { programsByName[$0.name] = $0 }
            }
        
        return programsByName.values.filter { $0.parent == nil }.first!
    }

    func rootProgramName(input: Input) -> String {
        return buildTree(input: input).name
    }
    
    public func part1Solution(for input: Input) -> String {
        rootProgramName(input: input).description
    }

    public func part2Solution(for input: Input) -> String {
        let rootProgram = buildTree(input: input)
        rootProgram.recursivePrint()
        return rootProgram.requiredWeightForUnbalancedProgram()!.description
    }
}
