import Algorithms
import Foundation
import Utilities
import RegexBuilder

public struct Day11: Day {
    struct Monkey {
        let number: Int
        var items: [Int]
        var inspections = 0
        
        let lhsOperand: Int?
        let rhsOperand: Int?
        let operation: (Int, Int) -> Int
        
        let testAmount: Int
        let testTrueTarget: Int
        let testFalseTarget: Int
    }
    
    func parse(input: Input) -> [Monkey] {
        let numberReference = Reference(Int.self)
        let itemsReference = Reference([Int].self)
        let lhsReference = Reference(Int?.self)
        let rhsReference = Reference(Int?.self)
        let operationReference = Reference(((Int, Int) -> Int).self)
        let testReference = Reference(Int.self)
        let trueTargetReference = Reference(Int.self)
        let falseTargetReference = Reference(Int.self)
        
        let regex = Regex {
            "Monkey "
            TryCapture(as: numberReference) {
                OneOrMore(.digit)
            } transform: { Int($0) }
            ZeroOrMore(.any, .reluctant)

            "Starting items: "
            TryCapture(as: itemsReference) {
                OneOrMore {
                    OneOrMore(.digit)
                    Optionally(", ")
                }
            } transform: { string in
                string.components(separatedBy: .decimalDigits.inverted)
                    .compactMap { Int($0) }
            }
            ZeroOrMore(.whitespace)

            "Operation: new = "
            TryCapture(as: lhsReference) {
                ChoiceOf {
                    "old"
                    OneOrMore(.digit)
                }
            } transform: { Int($0) }
            ZeroOrMore(.whitespace)
            TryCapture(as: operationReference) {
                One(.anyOf("+*"))
            } transform: { c in
                switch c {
                case "+":
                    return { $0 + $1 }
                case "*":
                    return { $0 * $1 }
                default:
                    return nil
                }
            }
            ZeroOrMore(.whitespace)
            TryCapture(as: rhsReference) {
                ChoiceOf {
                    "old"
                    OneOrMore(.digit)
                }
            } transform: { Int($0) }
            ZeroOrMore(.whitespace)

            "Test: divisible by "
            TryCapture(as: testReference) {
                OneOrMore(.digit)
            } transform: { Int($0) }
            ZeroOrMore(.whitespace)
            "If true: throw to monkey "
            TryCapture(as: trueTargetReference) { OneOrMore(.digit) } transform: { Int($0) }
            ZeroOrMore(.whitespace)
            "If false: throw to monkey "
            TryCapture(as: falseTargetReference) { OneOrMore(.digit) } transform: { Int($0) }
        }
        
        return input.raw.matches(of: regex)
            .map { match in
                Monkey(
                    number: match[numberReference],
                    items: match[itemsReference],
                    lhsOperand: match[lhsReference],
                    rhsOperand: match[rhsReference],
                    operation: match[operationReference],
                    testAmount: match[testReference],
                    testTrueTarget: match[trueTargetReference],
                    testFalseTarget: match[falseTargetReference]
                )
            }
    }
    
    public func part1Solution(for input: Input) -> Int {
        var monkeys = parse(input: input)
        
        for _ in 1...20 {
            for index in monkeys.indices {
                while var item = monkeys[index].items.first {
                    monkeys[index].items.removeFirst()
                    monkeys[index].inspections += 1
                    
                    let lhs = monkeys[index].lhsOperand ?? item
                    let rhs = monkeys[index].rhsOperand ?? item
                    item = monkeys[index].operation(lhs, rhs)
                    
                    item /= 3
                    
                    let target = item.isMultiple(of: monkeys[index].testAmount)
                    ? monkeys[index].testTrueTarget
                    : monkeys[index].testFalseTarget
                    
                    monkeys[target].items.append(item)
                }
            }
        }
        
        return monkeys.map(\.inspections).max(count: 2).product()
    }

    public func part2Solution(for input: Input) -> Int {
        var monkeys = parse(input: input)
        
        let multiple = monkeys.map(\.testAmount).product()
        
        for _ in 1...10000 {
            for index in monkeys.indices {
                while var item = monkeys[index].items.first {
                    monkeys[index].items.removeFirst()
                    monkeys[index].inspections += 1
                    
                    let lhs = monkeys[index].lhsOperand ?? item
                    let rhs = monkeys[index].rhsOperand ?? item
                    item = monkeys[index].operation(lhs, rhs)
                    
                    item = item % multiple
                    
                    let target = item.isMultiple(of: monkeys[index].testAmount)
                    ? monkeys[index].testTrueTarget
                    : monkeys[index].testFalseTarget
                    
                    monkeys[target].items.append(item)
                }
            }
        }
        
        return monkeys.map(\.inspections).max(count: 2).product()
    }
}
