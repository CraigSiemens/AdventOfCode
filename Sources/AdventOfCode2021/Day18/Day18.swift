import Foundation

public struct Day18: Day {
    public func part1Solution(for input: Input) -> String {
        input.lines
            .map { try! $0.decode(type: SnailfishNumber.self) }
            .reduce(SnailfishNumber(), +)
            .magnitude
            .description
    }
    
    public func part2Solution(for input: Input) -> String {
        input.lines
            .map { try! $0.decode(type: SnailfishNumber.self) }
            .permutations(ofCount: 2)
            .map { $0[0].copy() + $0[1].copy() }
            .map(\.magnitude)
            .max()!
            .description
    }
}

private class SnailfishNumber: Decodable {
    weak var parent: SnailfishNumber?
    var value: Int?
    var left: SnailfishNumber?
    var right: SnailfishNumber?
    
    var magnitude: Int {
        value
        ?? 3 * (left?.magnitude ?? 0)
        + 2 * (right?.magnitude ?? 0)
    }
    
    private var isEmpty: Bool {
        value == nil && left == nil && right == nil
    }
    
    init(value: Int? = nil,
         left: SnailfishNumber? = nil,
         right: SnailfishNumber? = nil
    ) {
        self.value = value
        self.left = left
        self.right = right
        
        updateChildren()
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()
            self.value = try container.decode(Int.self)
        } catch {
            var container = try decoder.unkeyedContainer()
            
            self.left = try container.decode(Self.self)
            self.right = try container.decode(Self.self)
            
            updateChildren()
        }
    }
    
    func copy() -> SnailfishNumber {
        .init(value: value, left: left?.copy(), right: right?.copy())
    }
    
    private func updateChildren() {
        left?.parent = self
        right?.parent = self
    }
    
    private func reduce() {
        while explodeIfNeeded() || splitIfNeeded() {}
    }
    
    private func explodeIfNeeded(level: Int = 0) -> Bool {
        guard value == nil,
              level == 4
        else {
            return left?.explodeIfNeeded(level: level + 1) ?? false
            || right?.explodeIfNeeded(level: level + 1) ?? false
        }
        
        let prev: SnailfishNumber? = {
            var current: SnailfishNumber? = self
            while current?.parent?.left === current {
                current = current?.parent
            }
            current = current?.parent?.left
            
            while current != nil, current?.value == nil {
                current = current?.right
            }
            
            return current
        }()
        
        let next: SnailfishNumber? = {
            var current: SnailfishNumber? = self
            while current?.parent?.right === current {
                current = current?.parent
            }
            current = current?.parent?.right
            
            while current != nil, current?.value == nil {
                current = current?.left
            }
            
            return current
        }()
        
        prev?.value! += left!.value!
        next?.value! += right!.value!
        
        value = 0
        left = nil
        right = nil
        
        return true
    }
    
    private func splitIfNeeded() -> Bool {
        guard let value = value,
              value >= 10
        else {
            return left?.splitIfNeeded() ?? false
            || right?.splitIfNeeded() ?? false
        }
        
        self.value = nil
        
        let result = value.quotientAndRemainder(dividingBy: 2)
        self.left = .init(value: result.quotient)
        self.right = .init(value: result.quotient + result.remainder)
        
        updateChildren()
        
        return true
    }
    
    static func +(lhs: SnailfishNumber, rhs: SnailfishNumber) -> SnailfishNumber {
        guard !lhs.isEmpty else { return rhs }
        guard !rhs.isEmpty else { return lhs }
        
        let result = SnailfishNumber(left: lhs, right: rhs)
        result.reduce()
        return result
    }
}

extension SnailfishNumber: CustomStringConvertible {
    var description: String {
        if let value = value {
            return value.description
        } else {
            return "[\(left!),\(right!)]"
        }
    }
}
