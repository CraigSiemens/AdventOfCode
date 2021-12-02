import Foundation

public struct Day13: Day {
    private func parseFirewall(input: String) -> [Int: Int] {
        let keysValues = input
            .components(separatedBy: "\n")
            .map { $0.components(separatedBy: ": ") }
            .map { a in a.compactMap { Int($0) } }
            .map { ($0[0], $0[1]) }
        return Dictionary(uniqueKeysWithValues: keysValues)
    }
    
    private func caughtFirewallLocations(firewall: [Int: Int], delay: Int = 0) -> [Int: Int] {
        return firewall
            .filter { ($0.0 + delay) % ($0.1 * 2 - 2) == 0 }
    }
    
    public func part1Solution(for input: String = input) -> String {
        let firewall = parseFirewall(input: input)
        
        return caughtFirewallLocations(firewall: firewall)
            .map { $0.0 * $0.1 }
            .reduce(0, +)
            .description
    }
    
    public func part2Solution(for input: String = input) -> String {
        let firewall = parseFirewall(input: input)
        
        var delay = 0
        while !caughtFirewallLocations(firewall: firewall, delay: delay).isEmpty {
            delay += 1
        }
        return "\(delay)"
    }
}
