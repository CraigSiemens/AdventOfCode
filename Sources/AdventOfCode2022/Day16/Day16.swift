import Algorithms
import Foundation
import Utilities

public struct Day16: Day {
    class Valve: Hashable {
        let name: String
        var rate: Int = 0
        var connectedValves: [Valve] = []
        
        init(name: String) {
            self.name = name
        }
        
        static func == (lhs: Day16.Valve, rhs: Day16.Valve) -> Bool {
            lhs.name == rhs.name
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(name)
        }
        
        private var cachedPaths: [Valve: [Valve]] = [:]
        func path(to: Valve) -> [Valve] {
            if let path = cachedPaths[to] {
                return path
            } else if let path = to.cachedPaths[self]?.reversed() {
                let path = Array(path)
                cachedPaths[to] = path
                return path
            }
            
            var visitedValves: Set<Valve> = []
            var possiblePaths: [[Valve]] = [[self]]
            
            while let path = possiblePaths.first {
                possiblePaths.removeFirst()
                
                for valve in path.last!.connectedValves
                where visitedValves.insert(valve).inserted {
                    let newPath = path + [valve]
                    guard valve != to else {
                        cachedPaths[to] = newPath
                        return newPath
                    }
                    
                    possiblePaths.append(newPath)
                }
            }
            
            return []
        }
    }
    
    func parse(input: Input) -> [String: Valve] {
        var valvesByName: [String: Valve] = [:]
        
        for line in input.lines {
            let parts = line.words(byCharactersIn: " =;,")
            
            let name = parts[1].raw
            let valve = valvesByName[name, default: Valve(name: name)]
            valve.rate = parts[5].int!
            valve.connectedValves = parts[10...].map {
                let valve = valvesByName[$0.raw, default: Valve(name: $0.raw)]
                valvesByName[$0.raw] = valve
                return valve
            }
            valvesByName[name] = valve
        }

        return valvesByName
    }
        
    func openValves(
        startingAt: Valve,
        remainingTime: Int,
        unopenedValves: Set<Valve>
    ) -> Int {
        guard !unopenedValves.isEmpty else { return 0 }
        
        var bestPressureReleased = 0
        for unopenedValve in unopenedValves {
            let path = startingAt.path(to: unopenedValve)
            let newRemainingTime = remainingTime - path.count
            var pressureReleased = newRemainingTime * unopenedValve.rate
            guard pressureReleased > 0 else { continue }
            
            pressureReleased += openValves(
                startingAt: unopenedValve,
                remainingTime: newRemainingTime,
                unopenedValves: unopenedValves.subtracting([unopenedValve])
            )
            
            bestPressureReleased = max(bestPressureReleased, pressureReleased)
        }
        
        return bestPressureReleased
    }
    
    public func part1Solution(for input: Input) -> Int {
        let valvesByName = parse(input: input)
        
        let unopenedValves = Set(
            valvesByName.values.filter { $0.rate > 0 }
        )
        
        return openValves(
            startingAt: valvesByName["AA"]!,
            remainingTime: 30,
            unopenedValves: unopenedValves
        )
    }

    public func part2Solution(for input: Input) -> Int {
        let valvesByName = parse(input: input)
        
        let start = valvesByName["AA"]!
        let unopenedValves: Set<Valve> = .init(
            valvesByName.values.filter { $0.rate > 0 }
        )
        
        return unopenedValves
            .combinations(ofCount: 1...unopenedValves.count/2)
            .map { subset in
                openValves(
                    startingAt: start,
                    remainingTime: 26,
                    unopenedValves: Set(subset)
                )
                + openValves(
                    startingAt: start,
                    remainingTime: 26,
                    unopenedValves: unopenedValves.subtracting(subset)
                )
            }
            .max()!
    }
}
