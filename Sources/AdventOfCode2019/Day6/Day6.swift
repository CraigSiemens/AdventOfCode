import Foundation

public struct Day6: Day {

    func nodes(for input: String) -> [String: Tree.Node<String>] {
        let relationships = Input(input)
            .lines
            .map { $0.raw.components(separatedBy: ")") }
        
        var nodes: [String: Tree.Node<String>] = [:]
        
        for relationship in relationships {
            let parent = relationship[0]
            let child = relationship[1]
            
            let parentNode = nodes[parent, default: .init(value: parent)]
            let childNode = nodes[child, default: .init(value: child)]

            nodes[parent] = parentNode
            nodes[child] = childNode
            
            parentNode.addChild(childNode)
        }

        return nodes
    }
    
    public func part1Solution(for input: String = input) -> String {
        let total = nodes(for: input)
            .values
            .reduce(into: 0) { (total, node) in
                total += node.allParents.count
            }
        
        return "\(total)"
    }

    public func part2Solution(for input: String = input) -> String {
        let nodes = self.nodes(for: input)
        
        let startParents = nodes["YOU"]!.allParents.reversed()
        let endParents = nodes["SAN"]!.allParents.reversed()
        
        let commonCount = zip(startParents, endParents)
            .filter { $0.0 == $0.1 }
            .count
        
        return "\(startParents.count - commonCount + endParents.count - commonCount)"
    }
}
