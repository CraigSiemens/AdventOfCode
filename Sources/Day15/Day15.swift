import Foundation
import Utilities

@available(OSX 10.11, *)
public struct Day15: Day {
    public init() {}

    enum Race: String {
        case elf = "E"
        case goblin = "G"
    }
    
    class Combatant: CustomStringConvertible, Hashable {
        static func == (lhs: Day15.Combatant, rhs: Day15.Combatant) -> Bool {
            return lhs === rhs
        }
        
        var hashValue: Int {
            return ObjectIdentifier(self).hashValue
        }
        
        var health = 200
        var position: Point
        let race: Race
        
        init(position: Point, race: Race) {
            self.position = position
            self.race = race
        }
        
        var description: String {
            return "\(race.rawValue)(\(health))"
        }
    }
    
    class Node: GKGridGraphNode {
        override var description: String {
            return "\(gridPosition)"
        }
    }
    
    struct NodePair: Comparable {
        static func < (lhs: Day15.NodePair, rhs: Day15.NodePair) -> Bool {
            let lep = lhs.end.gridPosition.point
            let rep = rhs.end.gridPosition.point
            return lep < rep
                || (lep == rep
                    && lhs.start.gridPosition.point < rhs.start.gridPosition.point)
        }
        
        var start: Node
        var end: Node
    }
    
    struct CombatState {
        var number: Int
        let walls: Set<Point>
        private(set) var combatants: Set<Combatant>
        
        var graph: GKGridGraph<Node>
        
        init(number: Int, walls: Set<Point>, combatants: Set<Combatant>) {
            self.number = number
            self.walls = walls
            self.combatants = combatants

            let (min, max) = walls.extremes()
            let diff = max - min
            graph = GKGridGraph(fromGridStartingAt: min.int2,
                                width: Int32(diff.x) + 1,
                                height: Int32(diff.y) + 1,
                                diagonalsAllowed: false,
                                nodeClass: Node.self)
            
            graph.remove(walls.compactMap { graph.node(atGridPosition: $0.int2) })
            graph.remove(combatants.compactMap { graph.node(atGridPosition: $0.position.int2) })
        }
        
        var outcome: Int {
            return number
                * combatants.map { $0.health }.sum()
        }
        
        mutating func remove(combatant: Combatant) {
            let node = Node(gridPosition: combatant.position.int2)
            graph.connectToAdjacentNodes(node: node)
            graph.add([node])
            combatants.remove(combatant)
        }
        
        mutating func move(combatant: Combatant, to point: Point) {
            guard combatant.position != point else { fatalError() }
            
            let node = Node(gridPosition: combatant.position.int2)
            graph.connectToAdjacentNodes(node: node)
            graph.add([node])
            
            combatant.position = point
            graph.remove([graph.node(atGridPosition: point.int2)!])
        }
    }
    
    struct CombatRunner: Sequence, IteratorProtocol {
        var first = true
        var state: CombatState
        
        mutating func next() -> CombatState? {
            guard !first else {
                first.toggle()
                return state
            }
            
            guard state.combatants.countElements(by: \.race).count > 1 else {
                return nil
            }
            
            var nextState = state
            defer { state = nextState }
            
            for var current in state.combatants.sorted(by: { $0.position < $1.position }) {
                guard nextState.combatants.contains(current) else {
                    continue
                }
                
                let targets = nextState.combatants
                    .filter { $0.race != current.race }
                
                guard !targets.isEmpty else {
                    return nextState
                }
                
                func move() {
                    let graph = nextState.graph
                    
                    let optionalDestination = targets
                        .flatMap { $0.position.neighbours }
                        .compactMap { graph.node(atGridPosition: $0.int2) }
                        .flatMap { end -> [[GKGraphNode]] in
                            current.position
                                .neighbours
                                .compactMap { graph.node(atGridPosition: $0.int2) }
                                .map { graph.findPath(from: $0, to: end) }
                        }
                        .compactMap { $0 as? [Node] }
                        .filter { !$0.isEmpty }
                        .reduce(into: (Int.max, [NodePair]()), { (result, path) in
                            guard result.0 >= path.count else { return }
                            
                            if result.0 > path.count {
                                result.1.removeAll()
                            }
                            if let start = path.first, let end = path.last {
                                result.0 = path.count
                                result.1.append(NodePair(start: start, end: end))
                            }
                        })
                        .1
                        .sorted()
                        .first?
                        .start
                    
                    if let destination = optionalDestination  {
                        nextState.move(combatant: current, to: destination.gridPosition.point)
                    }
                }
                
                @discardableResult
                func attack() -> Bool {
                    guard let target = targets
                        .filter({ current.position.neighbours.contains($0.position) })
                        .sorted(by: { $0.position < $1.position })
                        .min(by: { $0.health < $1.health }) else {
                            return false
                    }

                    target.health -= 3
                    if target.health <= 0 {
                        nextState.remove(combatant: target)
                    }
                    
                    return true
                }
                
                // Has a target in range
                if !attack() {
                    move()
                    attack()
                }
            }
            
            nextState.number += 1
            return nextState
        }
    }
    
    func combatState(from input: Input) -> CombatState {
        var walls = Set<Point>()
        var combatants = Set<Combatant>()

        input.lines
            .enumerated()
            .forEach { (y, line) in
                line.characters
                    .enumerated()
                    .forEach { (x, char) in
                        let point = Point(x: x, y: y)
                        switch char {
                        case "#": walls.insert(point)
                        default:
                            guard let race = Race(rawValue: "\(char)") else {
                                break
                            }
                            combatants.insert(Combatant(position: point, race: race))
                        }
                    }
            }
        return CombatState(number: 0,
                                walls: walls,
                                combatants: combatants)
    }
    
    public func part1Solution(for input: String = input) -> String {
        let input = Input(input)
        let emptyMap = input.lines.map { l in
            l.characters
                .map { $0 == "E" || $0 == "G" ? "." : $0 }
                .map { String($0) }
        }
        let startState = combatState(from: input)
        let runner = CombatRunner(first: true, state: startState)
            .map { state -> CombatState in
                var map = emptyMap
                state.combatants
                    .sorted(by: { $0.position < $1.position })
                    .forEach({ (combatant) in
                        let point = combatant.position
                        map[point.y][point.x] = combatant.race.rawValue
                        map[point.y].append(" \(combatant.description)")
                    })
                print("Round", state.number)
                print(map.map({ $0.joined() }).joined(separator: "\n"))
                return state
            }
        let finalState = Array(runner).last
        
        return "\(finalState?.outcome ?? -1)"
    }

    public func part2Solution(for input: String = input) -> String {
        return "not solved"
    }
}
