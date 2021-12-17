import Foundation

public extension BinaryInteger {
    init<C>(bits: C) where C: Collection, C.Element == Bool {
        var i: Self = 0
        for bit in bits {
            i <<= 1
            
            if bit {
                i += 1
            }
        }
        self = i
    }
    
    func bits(minLength: Int = 0) -> [Bool] {
        var bits = Array<Bool>()
        var i = self
        
        while i != 0 {
            bits.append(i & 0b1 == 0b1)
            i >>= 1
        }
        
        if bits.count < minLength {
            bits += Array(repeating: false, count: minLength - bits.count)
        }
        
        return bits.reversed()
    }
}
