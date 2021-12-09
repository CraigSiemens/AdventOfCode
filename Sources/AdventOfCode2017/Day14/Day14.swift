import Foundation

public struct Day14: Day {
    private func createMemory(input: Input) -> [[Bool]] {
        return (0..<128)
            .map { Input("\(input.raw)-\($0)") }
            .map { input in
                knotHash(input: input)
                    .map {
                        let string = String($0, radix: 2)
                        return string.padding(toLength: 8, withPad: "0", startingAt: 0)
                    }
                    .joined()
                    .map { $0 == "1" }
            }
    }
    
    public func part1Solution(for input: Input) -> String {
        let memory = createMemory(input: input).joined()
        
        return memory
            .filter { $0 }
            .count
            .description
    }

    public func part2Solution(for input: Input) -> String {
        func clearRegion(memory: inout [[Bool]], index: (Int, Int)) {
            guard 0..<128 ~= index.0,
                  0..<128 ~= index.1,
                  memory[index.0][index.1]
            else { return }
            
            memory[index.0][index.1] = false
            clearRegion(memory: &memory, index: (index.0, index.1-1))
            clearRegion(memory: &memory, index: (index.0-1, index.1))
            clearRegion(memory: &memory, index: (index.0, index.1+1))
            clearRegion(memory: &memory, index: (index.0+1, index.1))
        }
        
        var memory = createMemory(input: input)

        var regionCount = 0
        for x in 0..<128 {
            for y in 0..<128 {
                guard memory[x][y] else { continue }
                regionCount += 1
                clearRegion(memory: &memory, index: (x, y))
            }
        }
        
        return regionCount.description
    }
}
