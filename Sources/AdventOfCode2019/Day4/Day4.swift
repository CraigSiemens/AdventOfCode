import Foundation

public struct Day4: Day {
    public let number: Int = 4
    
    func isValidPassword(_ password: Int, strict: Bool) -> Bool {
        let string = String(password)
        let pairs = String(password).pairs
        
        return pairs.allSatisfy { $0.first <= $0.second }
            && pairs.contains { $0.first == $0.second }
            && (!strict
                || string.countElements().values.contains(2))
    }
    
    public func part1Solution(for input: String = input) -> String {
        let numbers = input
            .components(separatedBy: "-")
            .map { Int($0)! }
                
        let passwords = (numbers[0]...numbers[1])
            .filter { isValidPassword($0, strict: false) }
        
        return "\(passwords.count)"
    }

    public func part2Solution(for input: String = input) -> String {
        let numbers = input
            .components(separatedBy: "-")
            .map { Int($0)! }
                
        let passwords = (numbers[0]...numbers[1])
            .filter { isValidPassword($0, strict: true) }

        return "\(passwords.count)"
    }
}
