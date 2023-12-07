import Algorithms
import Foundation
import Utilities

public struct Day7: Day {
    public func part1Solution(for input: Input) -> Int {
        input.lines
            .map(\.words)
            .map { (hand: Hand(jacks: $0[0].raw), bid: $0[1].int!) }
            .sorted { $0.hand < $1.hand }
            .enumerated()
            .map { $0.element.bid * ($0.offset + 1) }
            .sum()
    }
    
    public func part2Solution(for input: Input) -> Int {
        input.lines
            .map(\.words)
            .map { (hand: Hand(jokers: $0[0].raw), bid: $0[1].int!) }
            .sorted { $0.hand < $1.hand }
            .enumerated()
            .map { $0.element.bid * ($0.offset + 1) }
            .sum()
    }
}

private struct Hand: Comparable {
    enum HandType: Comparable {
        case highCard
        case onePair
        case twoPair
        case threeOfAKind
        case fullHouse
        case fourOfAKind
        case fiveOfAKind
    }
    
    let string: String
    let cards: [Int]
    let type: HandType
    
    init(jacks string: String) {
        self.string = string
        
        self.cards = string.map { c in
            switch c {
            case "A": return 14
            case "K": return 13
            case "Q": return 12
            case "J": return 11
            case "T": return 10
            default: return c.wholeNumberValue!
            }
        }
        
        let counts = cards.countElements().values.countElements()
        if counts[5] == 1 {
            type = .fiveOfAKind
        } else if counts[4] == 1 {
            type = .fourOfAKind
        } else if counts[3] == 1, counts[2] == 1 {
            type = .fullHouse
        } else if counts[3] == 1 {
            type = .threeOfAKind
        } else if counts[2] == 2 {
            type = .twoPair
        } else if counts[2] == 1 {
            type = .onePair
        } else {
            type = .highCard
        }
    }
    
    init(jokers string: String) {
        self.string = string
        
        self.cards = string.map { c in
            switch c {
            case "A": return 14
            case "K": return 13
            case "Q": return 12
            case "J": return 0
            case "T": return 10
            default: return c.wholeNumberValue!
            }
        }
        
        var cardCounts = cards.countElements()
        let jokerCount = cardCounts.removeValue(forKey: 0) ?? 0
        let counts = cardCounts.values.countElements()
        
        if counts[5] == 1 || jokerCount == 5 {
            type = .fiveOfAKind
        } else if counts[4] == 1 {
            if jokerCount == 1 {
                type = .fiveOfAKind
            } else {
                type = .fourOfAKind
            }
        } else if counts[3] == 1, counts[2] == 1 {
            type = .fullHouse
        } else if counts[3] == 1 {
            if jokerCount == 2 {
                type = .fiveOfAKind
            } else if jokerCount == 1 {
                type = .fourOfAKind
            } else {
                type = .threeOfAKind
            }
        } else if counts[2] == 2 {
            if jokerCount == 1 {
                type = .fullHouse
            } else {
                type = .twoPair
            }
        } else if counts[2] == 1 {
            if jokerCount == 3 {
                type = .fiveOfAKind
            } else if jokerCount == 2 {
                type = .fourOfAKind
            } else if jokerCount == 1 {
                type = .threeOfAKind
            } else {
                type = .onePair
            }
        } else {
            if jokerCount == 4 {
                type = .fiveOfAKind
            } else if jokerCount == 3 {
                type = .fourOfAKind
            } else if jokerCount == 2 {
                type = .threeOfAKind
            } else if jokerCount == 1 {
                type = .onePair
            } else {
                type = .highCard
            }
        }
    }
    
    static func < (lhs: Hand, rhs: Hand) -> Bool {
        lhs.type < rhs.type
        || lhs.type == rhs.type && lhs.cards.lexicographicallyPrecedes(rhs.cards)
    }
}
