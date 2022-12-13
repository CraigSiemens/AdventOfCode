import Algorithms
import Foundation
import Utilities

public struct Day13: Day {
    indirect enum Packet: Decodable, Comparable {
        case list([Packet])
        case value(Int)
        
        init(from decoder: Decoder) throws {
            do {
                let container = try decoder.singleValueContainer()
                self = .value(try container.decode(Int.self))
            } catch {
                var container = try decoder.unkeyedContainer()
                var list: [Self] = []
                while !container.isAtEnd {
                    list.append(try container.decode(Self.self))
                }
                self = .list(list)
            }
        }
        
        static func <(lhs: Self, rhs: Self) -> Bool {
            switch (lhs, rhs) {
            case let (.value(l), .value(r)):
                return l < r
            case let (.list(l), .list(r)):
                return l.lexicographicallyPrecedes(r)
            case (.value, .list):
                return .list([lhs]) < rhs
            case (.list, .value):
                return lhs < .list([rhs])
            }
        }
    }
    
    public func part1Solution(for input: Input) -> Int {
        input.words(by: "\n\n")
            .map { $0.lines.map { try! $0.decode(type: Packet.self) } }
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
