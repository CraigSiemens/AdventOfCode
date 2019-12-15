import Foundation

extension BinaryInteger {
    public func gcd(with other: Self) -> Self {
        guard self != 0 else { return other }
        return (other % self).gcd(with: self)
    }
    
//    def gcd(a,b):
//        if a == 0:
//            return b
//        return gcd(b % a, a)
//
//    # Function to return LCM of two numbers
//    def lcm(a,b):
//        return (a*b) / gcd(a,b)
}
