import Foundation

public struct Day12: Day {
    enum Cave: Hashable {
        case start
        case small(String)
        case large(String)
        case end
        
        init(string: String) {
            if string == "start" {
                self = .start
            } else if string == "end" {
                self = .end
            } else if string.allSatisfy(\.isLowercase) {
                self = .small(string)
            } else {
                self = .large(string)
            }
        }
    }
    
    func graph(from input: Input) -> [Cave: [Cave]] {
        var graph = Dictionary<Cave, [Cave]>()
        
        input.lines
            .map { $0.words(by: "-").raw.map(Cave.init) }
            .forEach {
                if $0[1] != .start {
                    graph[$0[0], default: []].append($0[1])
                }
                
                if $0[0] != .start {
                    graph[$0[1], default: []].append($0[0])
                }
            }
        
        return graph
    }
    
    public func part1Solution(for input: Input) -> String {
        let graph = graph(from: input)
        
        func countPaths(from: Cave, visited: Set<Cave>) -> Int {
            var count = 0
            
            for cave in graph[from, default: []]
            where !visited.contains(cave) {
                switch cave {
                case .small:
                    count += countPaths(
                        from: cave,
                        visited: visited.union([cave])
                    )
                case .large:
                    count += countPaths(from: cave, visited: visited)
                case .end:
                    count += 1
                case .start:
                    fatalError()
                }
            }
            
            return count
        }
        
        return countPaths(from: .start, visited: [])
            .description
    }
    
    public func part2Solution(for input: Input) -> String {
        let graph = graph(from: input)
        
        func countPaths(from: Cave, visited: Set<Cave>, hasVisitedTwice: Bool) -> Int {
            var count = 0
            
            for cave in graph[from, default: []] {
                switch cave {
                case .small:
                    if visited.contains(cave) {
                        if !hasVisitedTwice {
                            count += countPaths(
                                from: cave,
                                visited: visited.union([cave]),
                                hasVisitedTwice: true
                            )
                        }
                    } else {
                        count += countPaths(
                            from: cave,
                            visited: visited.union([cave]),
                            hasVisitedTwice: hasVisitedTwice
                        )
                    }
                case .large:
                    count += countPaths(
                        from: cave,
                        visited: visited,
                        hasVisitedTwice: hasVisitedTwice
                    )
                case .end:
                    count += 1
                case .start:
                    fatalError()
                }
            }
            
            return count
        }
        
        return countPaths(from: .start, visited: [], hasVisitedTwice: false)
            .description
    }
}
