import Algorithms
import Foundation
import Utilities

public struct Day7: Day {
    typealias Node = Tree.Node<FileSystemItem>
    
    struct FileSystemItem {
        var size: Int = 0
        var name: String
        
        var type: FileType
        
        enum FileType {
            case file, directory
        }
    }
    
    func parse(input: Input) -> Node {
        let root = Tree.Node<FileSystemItem>(value: .init(name: "", type: .directory))
        var currentDirectory = root
        
        for words in input.lines.map(\.words) {
            if words[0] == "$" {
                switch words[1] {
                case "cd":
                    switch words[2] {
                    case "/":
                        currentDirectory = root
                    case "..":
                        currentDirectory = currentDirectory.parent!
                    default:
                        currentDirectory = currentDirectory.children
                            .first { $0.value.name == words[2].raw }!
                    }
                default:
                    break
                }
            } else {
                switch words[0] {
                case "dir":
                    currentDirectory.addChild(
                        .init(value: .init(name: words[1].raw, type: .directory))
                    )
                default:
                    let size = words[0].int!
                    let node = Node(value: .init(size: size, name: words[1].raw, type: .file))
                    
                    currentDirectory.addChild(node)
                    for parent in node.allParents {
                        parent.value.size += size
                    }
                }
            }
        }
        
        return root
    }
    
    public func part1Solution(for input: Input) -> Int {
        return parse(input: input)
            .sequence(order: .depthFirst(.pre))
            .filter { node in
                node.value.type == .directory
                && node.value.size <= 100000
            }
            .map(\.value.size)
            .sum()
    }

    public func part2Solution(for input: Input) -> Int {
        let root = parse(input: input)

        let totalSize = 70_000_000
        let targetAvailableSize = 30_000_000
        let minimumSize = targetAvailableSize - (totalSize - root.value.size)
        
        return root
            .sequence(order: .depthFirst(.pre))
            .filter { $0.value.type == .directory }
            .map(\.value.size)
            .sorted()
            .first { $0 >= minimumSize }!
    }
}
