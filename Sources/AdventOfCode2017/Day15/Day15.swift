import Foundation

public struct Day15: Day {
    public func part1Solution(for input: String = input) -> String {
        class Generator {
            var value: UInt
            let factor: UInt
            
            init(value: UInt, factor: UInt) {
                self.value = value
                self.factor = factor
            }
            
            func updateValue() {
                value = (value * factor) % 2147483647
            }
        }
        
        let startValues = input.components(separatedBy: ",").compactMap { UInt($0) }
        
        let genA = Generator(value: startValues[0], factor: 16807)
        let genB = Generator(value: startValues[1], factor: 48271)
        
        let mask: UInt = 0xffff
        
        var matchCount = 0
        for _ in 0..<40000000 {
            genA.updateValue()
            genB.updateValue()
            
            guard (genA.value & mask) == (genB.value & mask) else { continue }
            matchCount += 1
        }
        
        return matchCount.description
    }
    
    public func part2Solution(for input: String = input) -> String {
        class SkippingGenerator {
            var value: UInt
            let factor: UInt
            let multiple: UInt
            
            init(value: UInt, factor: UInt, multiple: UInt) {
                self.value = value
                self.factor = factor
                self.multiple = multiple
            }
            
            func updateValue() {
                repeat {
                    value = (value * factor) % 2147483647
                } while (value & (multiple-1)) != 0
            }
        }
        
        let startValues = input.components(separatedBy: ",").compactMap { UInt($0) }
        
        let genA = SkippingGenerator(value: startValues[0], factor: 16807, multiple: 4)
        let genB = SkippingGenerator(value: startValues[1], factor: 48271, multiple: 8)
        
        let mask: UInt = 0xffff
        
        var matchCount = 0
        for _ in 0..<5000000 {
            genA.updateValue()
            genB.updateValue()
            
            guard (genA.value & mask) == (genB.value & mask) else { continue }
            matchCount += 1
        }
        
        return matchCount.description
    }
}
