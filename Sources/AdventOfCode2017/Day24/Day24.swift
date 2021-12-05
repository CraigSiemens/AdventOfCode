import Foundation

public struct Day24: Day {
    struct BridgePiece {
        let inputPin: Int
        let outputPin: Int
        
        var flipped: BridgePiece {
            return BridgePiece(inputPin: outputPin, outputPin: inputPin)
        }
    }
    
    func parseInput(input: String) -> [BridgePiece] {
        return input
            .components(separatedBy: "\n")
            .map { $0.components(separatedBy: "/").compactMap { i in Int(i) } }
            .map { BridgePiece(inputPin: $0[0], outputPin: $0[1]) }
    }
    
    public func part1Solution(for input: String = input) -> String {
        func strongestBridge(current: [BridgePiece], remaining: [BridgePiece]) -> Int {
            let lastPin = current.last?.outputPin ?? 0
            
            var bestStrength = 0
            for (index, piece) in remaining.enumerated() {
                let strength: Int
                if piece.inputPin == lastPin {
                    var remaining = remaining
                    remaining.remove(at: index)
                    strength = strongestBridge(current: current + [piece], remaining: remaining) + piece.inputPin + piece.outputPin
                } else if piece.outputPin == lastPin {
                    var remaining = remaining
                    remaining.remove(at: index)
                    strength = strongestBridge(current: current + [piece.flipped], remaining: remaining) + piece.inputPin + piece.outputPin
                } else {
                    continue
                }
                
                bestStrength = max(bestStrength, strength)
            }
            
            return bestStrength
        }
        
        let pieces = parseInput(input: input)
        
        return strongestBridge(current: [], remaining: pieces).description
    }

    public func part2Solution(for input: String = input) -> String {
        typealias Result = (length: Int, strength: Int)
        
        func longestStrongestBridge(current: [BridgePiece], remaining: [BridgePiece]) -> Result {
            let lastPin = current.last?.outputPin ?? 0
            
            var bestResult: Result = (0, 0)
            for (index, piece) in remaining.enumerated() {
                var result: Result
                
                if piece.inputPin == lastPin {
                    var remaining = remaining
                    remaining.remove(at: index)
                    result = longestStrongestBridge(current: current + [piece], remaining: remaining)
                } else if piece.outputPin == lastPin {
                    var remaining = remaining
                    remaining.remove(at: index)
                    result = longestStrongestBridge(current: current + [piece.flipped], remaining: remaining)
                } else {
                    continue
                }
                
                result.length += 1
                result.strength += piece.inputPin + piece.outputPin
                
                if bestResult.length < result.length || (bestResult.length == result.length && bestResult.strength < result.strength) {
                    bestResult = result
                }
            }
            
            return bestResult
        }
        
        let pieces = parseInput(input: input)
        
        return longestStrongestBridge(current: [], remaining: pieces).1.description
    }
}
