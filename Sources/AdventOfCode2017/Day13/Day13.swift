import Foundation

public struct Day13: Day {
    private func parseFirewall(input: Input) -> [Int: Int] {
        let keysValues = input
            .lines
            .map { $0.words(by: ": ").integers }
            .map { ($0[0], $0[1]) }
        return Dictionary(uniqueKeysWithValues: keysValues)
    }
    
    private func caughtFirewallLocations(firewall: [Int: Int], delay: Int = 0) -> [Int: Int] {
        return firewall
            .filter { ($0.0 + delay) % ($0.1 * 2 - 2) == 0 }
    }
    
    public func part1Solution(for input: Input) -> String {
        let firewall = parseFirewall(input: input)
        
        return caughtFirewallLocations(firewall: firewall)
            .map { $0.0 * $0.1 }
            .reduce(0, +)
            .description
    }
    
    public func part2Solution(for input: Input) -> String {
        let firewall = parseFirewall(input: input)
        
        var delay = 0
        while !caughtFirewallLocations(firewall: firewall, delay: delay).isEmpty {
            delay += 1
        }
        return "\(delay)"
    }
}
