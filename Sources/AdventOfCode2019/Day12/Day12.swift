import Foundation

public struct Day12: Day {

    struct Planet: Equatable {
        var position: SIMD3<Int>
        var velocity: SIMD3<Int>
                
        var potentialEnergy: Int {
            abs(position.x) + abs(position.y) + abs(position.z)
        }
        
        var kineticEnergy: Int {
            abs(velocity.x) + abs(velocity.y) + abs(velocity.z)
        }
        
        var totalEnergy: Int {
            potentialEnergy * kineticEnergy
        }
    }
    
    func parse(input: String) -> [Planet] {
        Input(input)
            .lines
            .map {
                let scanner = Scanner(string: $0.raw)
                return Planet(position: .init(x: scanner.nextInt()!,
                                              y: scanner.nextInt()!,
                                              z: scanner.nextInt()!),
                              velocity: .zero)
        }
    }
    
    func runSimulation(planets: [Planet], steps: Int) -> [Planet] {
        var planets = planets
        
        for _ in 0..<steps {
            for pair in Combinations(from: planets.indices) {
                let diff = (planets[pair.0].position &- planets[pair.1].position)
                    .clamped(lowerBound: SIMD3<Int>.one &* -1,
                             upperBound: SIMD3<Int>.one)

                planets[pair.0].velocity &+= (diff &* -1)
                planets[pair.1].velocity &+= diff
            }
            
            for i in planets.indices {
                planets[i].position &+= planets[i].velocity
            }
        }
        
        return planets
    }
    
    public func part1Solution(for input: String = input) -> String {
        let totalEnergy = runSimulation(planets: parse(input: input), steps: 1000)
            .map { $0.totalEnergy }
            .sum()
        
        return "\(totalEnergy)"
    }

    func repeatTime(planets: [Planet]) -> Int {
        let start = planets
        var planets = planets
        
        var repeatTime = SIMD3<Int>.zero
        
        var time = 0
        while repeatTime.min() == 0 {
            time += 1
            for pair in Combinations(from: planets.indices) {
                let diff = (planets[pair.0].position &- planets[pair.1].position)
                    .clamped(lowerBound: SIMD3<Int>.one &* -1,
                             upperBound: SIMD3<Int>.one)

                planets[pair.0].velocity &+= (diff &* -1)
                planets[pair.1].velocity &+= diff
            }
            
            for i in planets.indices {
                planets[i].position &+= planets[i].velocity
            }
            
            func updateRepeatTime(for key: WritableKeyPath<SIMD3<Int>, Int>) {
                guard repeatTime[keyPath: key] == 0 else { return }
                
                let startValues = start
                    .map { Pair($0.position[keyPath: key], $0.velocity[keyPath: key]) }
                let currentValues = planets
                    .map { Pair($0.position[keyPath: key], $0.velocity[keyPath: key]) }
                
                guard startValues == currentValues else { return }
                
                repeatTime[keyPath: key] = time
            }
            
            updateRepeatTime(for: \.x)
            updateRepeatTime(for: \.y)
            updateRepeatTime(for: \.z)
        }
        
        print(repeatTime)
        return repeatTime.x.lcm(with: repeatTime.y.lcm(with: repeatTime.z))
    }
    
    public func part2Solution(for input: String = input) -> String {
        return "\(repeatTime(planets: parse(input: input)))"
    }
}
