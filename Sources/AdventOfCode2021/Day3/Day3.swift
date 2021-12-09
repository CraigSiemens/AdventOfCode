import Foundation

public struct Day3: Day {
    public func part1Solution(for input: Input) -> String {
        let input = input
            .lines
            .characters
            .map(\.bits)
        
        var count = Array(repeating: 0, count: input[0].count)
        
        for line in input {
            for (index, bit) in line.enumerated()
            where bit {
                count[index] += 1
            }
        }
        
        let commonBits = count.map { $0 > input.count / 2 }
        
        let gammaRate = Int(bits: commonBits)
        
        let epsilonRate = Int(bits: commonBits.map { !$0 })
        
        return "\(gammaRate * epsilonRate)"
    }

    public func part2Solution(for input: Input) -> String {
        let input = input
            .lines
            .characters
            .map(\.bits)
        
        var count = Array(repeating: 0, count: input[0].count)
        
        for line in input {
            for (index, bit) in line.enumerated()
            where bit {
                count[index] += 1
            }
        }
        
        var oxygenGeneratorCount = count
        var oxygenGeneratorInput = input
        
        for index in count.indices {
            guard oxygenGeneratorInput.count > 1 else { break }
            
            let mostCommonBit = oxygenGeneratorCount[index] >= (oxygenGeneratorInput.count + 1) / 2
            
            let partitionIndex = oxygenGeneratorInput
                .partition {
                    return $0[index] != mostCommonBit
                }
            
            let removalRange = partitionIndex..<oxygenGeneratorInput.endIndex
            
            oxygenGeneratorInput[removalRange]
                .forEach {
                    for (index, bit) in $0.enumerated()
                    where bit {
                        oxygenGeneratorCount[index] -= 1
                    }
                }
            
            oxygenGeneratorInput.removeSubrange(removalRange)
        }
        
        
        var co2ScrubberCount = count
        var co2ScrubberInput = input
        
        for index in count.indices {
            guard co2ScrubberInput.count > 1 else { break }
            
            let leastCommonBit = co2ScrubberCount[index] < (co2ScrubberInput.count + 1) / 2
            
            let partitionIndex = co2ScrubberInput
                .partition {
                    return $0[index] != leastCommonBit
                }
            
            let removalRange = partitionIndex..<co2ScrubberInput.endIndex
            
            co2ScrubberInput[removalRange]
                .forEach {
                    for (index, bit) in $0.enumerated()
                    where bit {
                        co2ScrubberCount[index] -= 1
                    }
                }
            
            co2ScrubberInput.removeSubrange(removalRange)
        }
        
        let oxygenGeneratorRating = Int(bits: oxygenGeneratorInput[0])

        let co2ScrubberRating = Int(bits: co2ScrubberInput[0])

        return "\(oxygenGeneratorRating * co2ScrubberRating)"
    }
}
