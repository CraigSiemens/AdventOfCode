import Algorithms
import Foundation
import Utilities

// Uses an expression tree
// Rotates it to solve of a variable on one side.
// https://en.wikipedia.org/wiki/Binary_expression_tree
// Probably could have iterated up from the node to solve

public struct Day21: Day {
    enum Monkey {
        case value(Int)
        case operation(Operation)
        
        enum Operation {
            case addition, subtraction, multiplication, division
        }
    }
    
    func parse(input: Input) -> [String: Tree.Node<Monkey?>] {
        var nodesByName: [String: Tree.Node<Monkey?>] = [:]
        
        func monkeyNode(named: Word) -> Tree.Node<Monkey?> {
            let node = nodesByName[named.raw] ?? .init(value: nil)
            nodesByName[named.raw] = node
            return node
        }
        
        for line in input.lines {
            let words = line.words(byCharactersIn: ": ")
            
            let node = monkeyNode(named: words[0])
            
            if let value = words[1].int {
                node.value = .value(value)
            } else {
                switch words[2] {
                case "+":
                    node.value = .operation(.addition)
                case "-":
                    node.value = .operation(.subtraction)
                case "*":
                    node.value = .operation(.multiplication)
                case "/":
                    node.value = .operation(.division)
                default: fatalError()
                }
                
                node.addChild(monkeyNode(named: words[1]))
                node.addChild(monkeyNode(named: words[3]))
            }
        }
        
        return nodesByName
    }
    
    public func part1Solution(for input: Input) -> Int {
        parse(input: input)["root"]!.calculateValue
    }
    
    public func part2Solution(for input: Input) -> Int {
        let nodesByName = parse(input: input)
        
        let human = nodesByName["humn"]!
        let nodesToRotate = [human] + human.allParents
        
        for window in nodesToRotate.reversed().windows(ofCount: 3) {
            let nodes = Array(window)
            let parent = nodes[0]
            let current = nodes[1]
            let otherChildIndex = current.children.firstIndex { $0 !== nodes[2] }!
            let otherChild = current.children[otherChildIndex]
            
            parent.removeChild(current)
            current.removeChild(otherChild)
            current.addChild(parent)
            
            switch current.value! {
            case .value: fatalError()
            case .operation(.addition):
                parent.addChild(otherChild)
                parent.value = .operation(.subtraction)
            case .operation(.subtraction):
                if otherChildIndex == 0 {
                    parent.insertChild(otherChild, at: 0)
                    parent.value = .operation(.subtraction)
                } else {
                    parent.addChild(otherChild)
                    parent.value = .operation(.addition)
                }
            case .operation(.multiplication):
                parent.addChild(otherChild)
                parent.value = .operation(.division)
            case .operation(.division):
                if otherChildIndex == 0 {
                    parent.insertChild(otherChild, at: 0)
                    parent.value = .operation(.division)
                } else {
                    parent.addChild(otherChild)
                    parent.value = .operation(.multiplication)
                }
            }
        }
        
        return human.parent!.children.first { $0 !== human }!.calculateValue
    }
}

private extension Tree.Node where Value == Day21.Monkey? {
    var calculateValue: Int {
        switch value! {
        case let .value(value):
            return value
        case .operation(.addition):
            return children[0].calculateValue + children[1].calculateValue
        case .operation(.subtraction):
            return children[0].calculateValue - children[1].calculateValue
        case .operation(.multiplication):
            return children[0].calculateValue * children[1].calculateValue
        case .operation(.division):
            return children[0].calculateValue / children[1].calculateValue
        }
    }
}
