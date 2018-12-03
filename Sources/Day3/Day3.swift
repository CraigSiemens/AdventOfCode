import Foundation

extension Scanner {
    func nextInt() -> Int? {
        scanUpToCharacters(from: .decimalDigits, into: nil)
        
        var int = 0
        guard scanInt(&int) else { return nil }
        return int
    }
}

public struct Day3 {
    public init() {}
    
    struct Claim {
        let id: Int
        let x, y, width, height: Int
        
        init?(string: String) {
            let scanner = Scanner(string: string)
            guard let id = scanner.nextInt(),
                let x = scanner.nextInt(),
                let y = scanner.nextInt(),
                let width = scanner.nextInt(),
                let height = scanner.nextInt() else {
                    return nil
            }
            
            self.id = id
            self.x = x
            self.y = y
            self.width = width
            self.height = height
        }
    }
    
    struct Fabric {
        var claimCounts = Array(repeating: Array(repeating: 0, count: 1000), count: 1000)
        
        var multiClaimCount: Int {
            return claimCounts
                .joined()
                .filter { $0 > 1 }
                .count
        }
        
        mutating func add(claim: Claim) {
            for y in claim.y..<(claim.y + claim.height) {
                for x in claim.x..<(claim.x + claim.width) {
                    claimCounts[y][x] += 1
                }
            }
        }
        
        func maxIntersectCount(for claim: Claim) -> Int {
            var intersectCount = 0
            for y in claim.y..<(claim.y + claim.height) {
                for x in claim.x..<(claim.x + claim.width) {
                    intersectCount = max(intersectCount, claimCounts[y][x])
                }
            }
            return intersectCount
        }
    }
    
    public func part1Solution(for input: String = input) -> String {
        var fabric = Fabric()
        
        input
            .components(separatedBy: .newlines)
            .compactMap { Claim(string: $0) }
            .forEach { fabric.add(claim: $0) }
        
        return "\(fabric.multiClaimCount)"
    }

    public func part2Solution(for input: String = input) -> String {
        var fabric = Fabric()
        
        let claims = input
            .components(separatedBy: .newlines)
            .compactMap { Claim(string: $0) }
            
        claims.forEach { fabric.add(claim: $0) }
        
        return claims
            .first { fabric.maxIntersectCount(for: $0) == 1 }?
            .id
            .description
            ?? "UNKNOWN"
    }
}
