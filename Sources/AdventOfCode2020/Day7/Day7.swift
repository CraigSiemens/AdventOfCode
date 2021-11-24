import Foundation

public struct Day7: Day {
    public let number: Int = 7

    private typealias BagLimit = (count: Int, color: String)
    
    private func parseRules(input: String) -> [String: [BagLimit]] {
        let rules = Input(input)
            .lines
            .map { (line) -> (String, [BagLimit]) in
                let parts = line.raw
                    .components(separatedBy: "contain")
                    .map { $0.trimmingCharacters(in: CharacterSet(charactersIn: " .")) }
                
                var rule = parts[0]
                if rule.hasSuffix(" bag") {
                    rule.removeLast(4)
                } else if rule.hasSuffix(" bags") {
                    rule.removeLast(5)
                }
                
                let contains = parts[1]
                    .components(separatedBy: ", ")
                    .compactMap { (bag) -> BagLimit? in
                        let parts = bag.components(separatedBy: " ")
                        guard let count = Int(parts[0]) else {
                            return nil
                        }
                        
                        return (count, "\(parts[1]) \(parts[2])")
                    }
                
                return (rule, contains)
            }
        
        return Dictionary(uniqueKeysWithValues: rules)
    }
    
    public func part1Solution(for input: String = input) -> String {
        let rules = parseRules(input: input)
        
        var seenBags = Set<String>()
        var bagQueue = ["shiny gold"]
        
        while let bag = bagQueue.first {
            bagQueue.removeFirst()
            seenBags.insert(bag)
            
            for (key, value) in rules {
                guard value.first(where: { $0.color == bag }) != nil,
                      !seenBags.contains(key) else {
                    continue
                }
                
                bagQueue.append(key)
            }
        }
        
        return "\(seenBags.count - 1)"
    }

    public func part2Solution(for input: String = input) -> String {
        let rules = parseRules(input: input)
        
//        var seenBags = Set<String>()
//        var bagQueue = ["shiny gold"]
        
        func recursivelyCount(bag: String) -> Int {
            rules[bag]!
                .map {
                    $0.count + $0.count * recursivelyCount(bag: $0.color)
                }
                .reduce(0, +)
        }
        
        return "\(recursivelyCount(bag: "shiny gold"))"
    }
}
