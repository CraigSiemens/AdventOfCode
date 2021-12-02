import Foundation

extension BinaryInteger {
    public func gcd(with other: Self) -> Self {
        guard self != 0 else { return other }
        return (other % self).gcd(with: self)
    }
    
    public func lcm(with other: Self) -> Self {
        let gcd = self.gcd(with: other)
        guard gcd != 0 else { return 0 }
        
        return (self * other) / gcd
    }
}
