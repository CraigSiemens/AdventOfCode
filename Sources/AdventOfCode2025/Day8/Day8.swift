import Algorithms
import Foundation
import Utilities

public struct Day8: Day {
    public func part1Solution(for input: Input) -> Int {
        part1Solution(for: input, pairs: 1000)
    }
    
    public func part1Solution(for input: Input, pairs: Int) -> Int {
        let points = input.lines.map { line in
            let components = line.commaSeparatedWords.integers
            return SIMD3<Int>(components)
        }
        
        var bestPairs: [Pair] = []
        
        for i in points.indices {
            for j in points.indices.dropFirst(i + 1) {
                let pair = Pair(p1: points[i], p2: points[j])
                bestPairs.append(pair)
            }
        }
        
        bestPairs.sort()
        
        var circuits: [Set<SIMD3<Int>>] = []
        var insertCount = 0
        for pair in bestPairs {
            var lastCircuitIndex: Int?
            var inserted = false
            
            for index in circuits.indices.reversed() {
                guard circuits[index].contains(pair.p1)
                        || circuits[index].contains(pair.p2)
                else { continue }
                
                circuits[index].insert(pair.p1)
                circuits[index].insert(pair.p2)
                inserted = true
                
                if let last = lastCircuitIndex {
                    circuits[last].formUnion(circuits[index])
                    circuits.remove(at: index)
                    lastCircuitIndex = last - 1
                } else {
                    lastCircuitIndex = index
                }
            }
            
            if !inserted {
                circuits.append([pair.p1, pair.p2])
            }
            
            insertCount += 1
            
            if insertCount >= pairs {
                return circuits.map(\.count).sorted(by: >).prefix(3).product()
            }
        }
        
        return -1
    }
    
    public func part2Solution(for input: Input) -> Int {
        let points = input.lines.map { line in
            let components = line.commaSeparatedWords.integers
            return SIMD3<Int>(components)
        }
        
        var bestPairs: [Pair] = []
        
        for i in points.indices {
            for j in points.indices.dropFirst(i + 1) {
                let pair = Pair(p1: points[i], p2: points[j])
                bestPairs.append(pair)
            }
        }
        
        bestPairs.sort()
        
        var circuits: [Set<SIMD3<Int>>] = []
        for pair in bestPairs {
            var lastCircuitIndex: Int?
            var inserted = false
            
            for index in circuits.indices.reversed() {
                guard circuits[index].contains(pair.p1)
                        || circuits[index].contains(pair.p2)
                else { continue }
                
                circuits[index].insert(pair.p1)
                circuits[index].insert(pair.p2)
                inserted = true
                
                if let last = lastCircuitIndex {
                    circuits[last].formUnion(circuits[index])
                    circuits.remove(at: index)
                    lastCircuitIndex = last - 1
                } else {
                    lastCircuitIndex = index
                }
            }
            
            if !inserted {
                circuits.append([pair.p1, pair.p2])
            }
            
            if circuits.count == 1, circuits[0].count == points.count {
                return pair.p1.x * pair.p2.x
            }
        }
        
        return -1
    }
}

private struct Pair: Comparable {
    let p1: SIMD3<Int>
    let p2: SIMD3<Int>
    let distance: Double
    
    init(p1: SIMD3<Int>, p2: SIMD3<Int>) {
        self.p1 = p1
        self.p2 = p2
        self.distance = p1.distance(to: p2)
    }
    
    static func < (lhs: Pair, rhs: Pair) -> Bool {
        lhs.distance < rhs.distance
    }
}

private extension SIMD3<Int> {
    func distance(to other: Self) -> Double {
        let xDiff = x - other.x
        let xDiffSquare = xDiff * xDiff
        
        let yDiff = y - other.y
        let yDiffSquare = yDiff * yDiff
        
        let zDiff = z - other.z
        let zDiffSquare = zDiff * zDiff
        
        return sqrt(Double(xDiffSquare + yDiffSquare + zDiffSquare))
    }
}
