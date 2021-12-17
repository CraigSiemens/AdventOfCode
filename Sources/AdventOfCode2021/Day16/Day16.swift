import Foundation

public struct Day16: Day {
    enum TypeId: Int {
        /// VVVTTT(1####)*(0####)
        case literal = 4

        /// VVVTTT 0 (length:#[15]) (subpackets until length reached)
        /// VVVTTT 1 (count:#[11]) (subpackets until count reached)
        case sum = 0
        case product = 1
        case minimum = 2
        case maximum = 3
        case greaterThan = 5
        case lessThan = 6
        case equalTo = 7
    }
    
    enum Packet {
        // Type ID 4
        case literal(version: Int, value: Int)
        
        // Type ID 6
        case `operator`(version: Int, typeId: TypeId, subpackets: [Packet])
        
        init(bits: [Bool]) {
            var bits = ArraySlice(bits)
            self.init(bits: &bits)
        }
        
        init(bits: inout ArraySlice<Bool>) {
            let version = Int(bits: bits.prefix(3))
            bits.removeFirst(3)
            
            let typeId = TypeId(rawValue: Int(bits: bits.prefix(3)))!
            bits.removeFirst(3)
            
            if typeId == .literal {
                var valueBits = Array<Bool>()
                
                while true {
                    let group = bits.prefix(5)
                    bits.removeFirst(5)
                    
                    valueBits.append(contentsOf: group.suffix(4))
                    guard group.first == true else { break }
                }
                
                self = .literal(version: version, value: Int(bits: valueBits))
            } else {
                let lengthBit = bits.removeFirst()
                
                if lengthBit {
                    let count = Int(bits: bits.prefix(11))
                    bits.removeFirst(11)
                    
                    let subpackets = (0..<count).map { _ in Packet(bits: &bits) }
                    
                    self = .operator(version: version, typeId: typeId, subpackets: subpackets)
                } else {
                    let length = Int(bits: bits.prefix(15))
                    bits.removeFirst(15)
                    
                    let startingIndex = bits.indices.lowerBound
                    
                    var subpackets = Array<Packet>()
                    while bits.indices.lowerBound < startingIndex + length {
                        subpackets.append(.init(bits: &bits))
                    }
                    
                    self = .operator(version: version, typeId: typeId, subpackets: subpackets)
                }
            }
        }
        
        var versionSum: Int {
            switch self {
            case let .literal(version, _):
                return version
            case let .operator(version, _, subpackets):
                return version + subpackets.map(\.versionSum).sum()
            }
        }
        
        var evaluate: Int {
            switch self {
            case let .literal(_, value):
                return value
            case let .operator(_, typeId, subpackets):
                let values = subpackets.map(\.evaluate)
                
                switch typeId {
                case .literal:
                    fatalError()

                case .sum:
                    return values.sum()
                case .product:
                    return values.product()
                case .minimum:
                    return values.min()!
                case .maximum:
                    return values.max()!
                case .greaterThan:
                    return values[0] > values[1] ? 1 : 0
                case .lessThan:
                    return values[0] < values[1] ? 1 : 0
                case .equalTo:
                    return values[0] == values[1] ? 1 : 0
                }
            }
        }
    }
    
    public func part1Solution(for input: Input) -> String {
        let bits = input.characters.hexBits
        
        return Packet(bits: bits).versionSum.description
    }
    
    public func part2Solution(for input: Input) -> String {
        let bits = input.characters.hexBits
        
        return Packet(bits: bits).evaluate.description
    }
}
