import Foundation

struct Day7: Day {
    struct Requirement {
        let first, second: String
    }
    
    class Step: Comparable, Hashable {
        static func < (lhs: Day7.Step, rhs: Day7.Step) -> Bool {
            return lhs.name < rhs.name
        }
        
        static func == (lhs: Day7.Step, rhs: Day7.Step) -> Bool {
            return lhs.name == rhs.name
        }
        
        let name: String
        var remainingTime: Int
        
        var dependants: Set<Step> = []
        var dependencies: Set<Step> = []
        var isReady: Bool = true
        
        init(name: String) {
            self.name = name
            remainingTime = Int((name.first?.unicodeScalars.first?.value ?? 0) - 64)
        }
        
        func hash(into hasher: inout Hasher) {
            name.hash(into: &hasher)
        }
        
        func add(dependency: Step) {
            dependencies.insert(dependency)
            dependency.dependants.insert(self)
            isReady = false
        }
    }
    
    func parse(input: Input) -> [Step] {
        var stepsByName: [String: Step] = [:]
        func step(named name: String) -> Step {
            let step = stepsByName[name, default: Step(name: name)]
            stepsByName[name] = step
            return step
        }

        input
            .lines
            .map(\.words)
            .raw
            .map { Requirement(first: $0[1], second: $0[7]) }
            .forEach { (requirement) in
                step(named: requirement.second)
                    .add(dependency: step(named: requirement.first))
            }
        
        return stepsByName.values.map { $0 }
    }
    
    public func part1Solution(for input: Input) -> String {
        var index = 0
        var stepsToRun: [Step] = parse(input: input)
            .filter { $0.dependencies.isEmpty }
            .sorted()
        
        while index < stepsToRun.count {
            defer { index += 1}
            
            let step = stepsToRun[index]
            step.dependants.forEach { $0.dependencies.remove(step) }
            
            for readyStep in step.dependants.filter({ !$0.isReady && $0.dependencies.isEmpty }) {
                readyStep.isReady = true
                stepsToRun.sortedInsert(readyStep, after: index)
            }
        }
        
        return stepsToRun.map { $0.name }.joined()
    }

    func part2Solution(for input: Input, workers: Int, baseDuration: Int) -> String {
        let steps = parse(input: input)
        steps.forEach { $0.remainingTime += baseDuration }
        
        var time = -1
        var index = 0
        var stepsToRun: [Step] = steps
            .filter { $0.dependencies.isEmpty }
            .sorted()
        
        var workingStep: [Step?] = Array(repeating: nil, count: workers)
        var doneSteps: [Step] = []
        
        while doneSteps.count != steps.count {
            time += 1
            
            for worker in 0..<workers {
                if let step = workingStep[worker], step.remainingTime == 0 {
                    workingStep[worker] = nil
                    doneSteps.append(step)
                    
                    step.dependants.forEach { $0.dependencies.remove(step) }
                    
                    for readyStep in step.dependants.filter({ !$0.isReady && $0.dependencies.isEmpty }) {
                        readyStep.isReady = true
                        stepsToRun.sortedInsert(readyStep, after: index)
                    }
                }
                
                if workingStep[worker] == nil, index < stepsToRun.count {
                    workingStep[worker] = stepsToRun[index]
                    index += 1
                }
                
                workingStep[worker]?.remainingTime -= 1
            }
        }
        
        return "\(time)"
    }
    
    public func part2Solution(for input: Input) -> String {
        return part2Solution(for: input, workers: 5, baseDuration: 60)
    }
}
