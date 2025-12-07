import Foundation

public extension Int {
    init(digits: some Sequence<Int>) {
        var value = 0
        
        for digit in digits {
            assert(digit <= 10, "Digit is too large")
            value *= 10
            value += digit
        }
        
        self = value
    }
}

public extension Int {
    var digitCount: Int {
        var magnitude = 10
        for i in 1... {
            guard self >= magnitude else { return i }
            magnitude *= 10
        }
        return .max
    }
    
    var digits: [Int] {
        var value = self
        var digits: [Int] = []
        while value > 0 {
            let result = value.quotientAndRemainder(dividingBy: 10)
            digits.insert(result.remainder, at: 0)
            value = result.quotient
        }
        return digits
    }
}
