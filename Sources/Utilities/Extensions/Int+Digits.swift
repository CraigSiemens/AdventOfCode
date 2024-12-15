import Foundation

public extension Int {
    init(digits: [Int]) {
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
}
