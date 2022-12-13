import Algorithms
import Foundation
import Utilities

public struct Day13: Day {
    indirect enum Packet: Decodable, Comparable {
        case list([Packet])
        case value(Int)
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            do {
                self = .value(try container.decode(Int.self))
            } catch {
                self = .list(try container.decode([Self].self))
            }
        }
        
        static func <(lhs: Self, rhs: Self) -> Bool {
            switch (lhs, rhs) {
            case let (.value(lhs), .value(rhs)):
                return lhs < rhs
            case let (.list(lhs), .list(rhs)):
                return lhs.lexicographicallyPrecedes(rhs)
            case (.value, .list):
                return .list([lhs]) < rhs
            case (.list, .value):
                return lhs < .list([rhs])
            }
        }
    }
    
    public func part1Solution(for input: Input) -> Int {
        input.lines
            .split(on: \.isEmpty)
            .map { $0.map { try! $0.decode(type: Packet.self) } }
            .enumerated()
            .filter { _, pair in
                pair[0] < pair[1]
            }
            .map { $0.offset + 1 }
            .sum()
    }

    public func part2Solution(for input: Input) -> Int {
        let packets = input.lines
            .filter { !$0.isEmpty }
            .map { try! $0.decode(type: Packet.self) }

        let dividerPackets: [Packet] = [
            .list([.list([.value(2)])]),
            .list([.list([.value(6)])])
        ]
        
        let sortedPackets = (packets + dividerPackets).sorted()
        
        return (sortedPackets.firstIndex(of: dividerPackets[0])! + 1)
        * (sortedPackets.firstIndex(of: dividerPackets[1])! + 1)
    }
}
