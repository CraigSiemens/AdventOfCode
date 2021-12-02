import Foundation

public struct Day20: Day {
    struct Vector: Hashable {
        let x, y, z: Int
        
        var magnitude: UInt {
            return x.magnitude + y.magnitude + z.magnitude
        }
        
        static func +(lhs: Vector, rhs: Vector) -> Vector {
            return Vector(x: lhs.x + rhs.x,
                          y: lhs.y + rhs.y,
                          z: lhs.z + rhs.z)
        }
        
        static func +=(lhs: inout Vector, rhs: Vector) {
            lhs = lhs + rhs
        }
        
        static func *(lhs: Vector, rhs: Int) -> Vector {
            return Vector(x: lhs.x * rhs,
                          y: lhs.y * rhs,
                          z: lhs.z * rhs)
        }
        
        static func *=(lhs: inout Vector, rhs: Int) {
            lhs = lhs * rhs
        }
    }
    
    struct Particle {
        let id: Int
        var position: Vector
        var velocity: Vector
        var acceleration: Vector
        
        init(id: Int, string: String) {
            let parts = string
                .components(separatedBy: CharacterSet(charactersIn: "pva=<> ,"))
                .filter { !$0.isEmpty }
                .compactMap { Int($0) }
            
            self.id = id
            self.position = Vector(x: parts[0], y: parts[1], z: parts[2])
            self.velocity = Vector(x: parts[3], y: parts[4], z: parts[5])
            self.acceleration = Vector(x: parts[6], y: parts[7], z: parts[8])
        }
        
        mutating func update() {
            velocity += acceleration
            position += velocity
        }
    }
    
    public func part1Solution(for input: String = input) -> String {
        var particles = input
            .components(separatedBy: "\n")
            .enumerated()
            .map { Particle(id: $0.0, string: $0.1) }
        
        for _ in 0...10000 {
            for i in particles.indices {
                particles[i].update()
            }
        }
        
        return particles
            .sorted { $0.position.magnitude < $1.position.magnitude }
            .first!
            .id
            .description
    }
    
    public func part2Solution(for input: String = input) -> String {
        var particles = input
            .components(separatedBy: "\n")
            .enumerated()
            .map { Particle(id: $0.0, string: $0.1) }
        
        for _ in 0...10000 {
            var positions: [Vector: Int] = [:]
            
            for i in particles.indices {
                particles[i].update()
                positions[particles[i].position, default: 0] += 1
            }
            
            particles = particles.filter { positions[$0.position] == 1 }
        }
        
        return particles.count.description
    }
}
