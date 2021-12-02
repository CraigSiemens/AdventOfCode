import Foundation

public struct Day16: Day {
    var programSize: Int = 16
    
    class Dance {
        let size: Int
        var programs: [String]
        
        init(size: Int) {
            self.size = size
            programs = Array(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"].prefix(size))
        }
        
        func runSteps(steps: [DanceStep]) {
            for step in steps {
                runStep(step: step)
            }
        }
        
        func runStep(step: DanceStep) {
            switch step {
            case let .spin(amount):
                let suffix = programs.suffix(amount)
                programs.removeLast(amount)
                programs.insert(contentsOf: suffix, at: 0)
            case let .exchange(i, j):
                programs.swapAt(i, j)
            case let .partner(p, q):
                let i = programs.firstIndex(of: p)!
                let j = programs.firstIndex(of: q)!
                programs.swapAt(i, j)
            }
        }
    }
    
    enum DanceStep {
        case spin(Int)
        case exchange(Int, Int)
        case partner(String, String)
        
        init(string: String) {
            let name = string.first!
            let parts = string.dropFirst().components(separatedBy: "/")
            
            switch name {
            case "s":
                self = .spin(Int(parts[0])!)
            case "x":
                self = .exchange(Int(parts[0])!, Int(parts[1])!)
            case "p":
                self = .partner(parts[0], parts[1])
            default: fatalError()
            }
        }
    }
    
    func parseSteps(input: String) -> [DanceStep] {
        return input
            .components(separatedBy: ",")
            .map { DanceStep(string: $0) }
    }
    
    public func part1Solution(for input: String = input) -> String {
        func runDance(steps: [DanceStep], programs: [String]) -> [String] {
            var programs = programs
            
            for step in steps {
                switch step {
                case let .spin(amount):
                    let suffix = programs.suffix(amount)
                    programs.removeLast(amount)
                    programs.insert(contentsOf: suffix, at: 0)
                case let .exchange(i, j):
                    programs.swapAt(i, j)
                case let .partner(p, q):
                    let i = programs.firstIndex(of: p)!
                    let j = programs.firstIndex(of: q)!
                    programs.swapAt(i, j)
                }
            }
            
            return programs
        }
        
        let dance = Dance(size: programSize)
        let steps = parseSteps(input: input)
        
        dance.runSteps(steps: steps)
        
        return dance.programs.joined()
    }
    
    public func part2Solution(for input: String = input) -> String {
        func cycle(input: String, size: Int) -> [String] {
            let dance = Dance(size: size)
            let steps = parseSteps(input: input)
            
            var seen: [String] = []
            repeat {
                let string = dance.programs.joined()
                if seen.contains(string) {
                    break
                }
                seen.append(string)
                dance.runSteps(steps: steps)
            } while true
            
            return seen
        }
        
        let c = cycle(input: input, size: programSize)
        return c[1000000000 % c.count]
    }
}
