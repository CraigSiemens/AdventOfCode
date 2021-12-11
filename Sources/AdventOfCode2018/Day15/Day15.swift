import Foundation

@available(OSX 10.11, *)
struct Day15: Day {

    enum Race: String {
        case elf = "E"
        case goblin = "G"
    }
    
    struct Combatant: CustomStringConvertible, Hashable {
        static func == (lhs: Day15.Combatant, rhs: Day15.Combatant) -> Bool {
            return lhs.id == rhs.id
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        let id = UUID()
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
        
        mutating func move(combatant: inout Combatant, to point: Point) {
            guard combatant.position != point else { fatalError() }
            
            let node = Node(gridPosition: combatant.position.int2)
            graph.connectToAdjacentNodes(node: node)
            graph.add([node])
            
            combatant.position = point
            combatants.remove(combatant)
            combatants.insert(combatant)
            graph.remove([graph.node(atGridPosition: point.int2)!])
        }
        
        mutating func attack(target: Combatant, power: Int) {
            var target = target
            target.health -= power
            
            if target.health <= 0 {
                remove(combatant: target)
            } else {
                combatants.remove(target)
                combatants.insert(target)
            }
        }
    }
    
    struct CombatRunner: Sequence, IteratorProtocol {
        var first = true
        var state: CombatState
        let elfPower: Int
        
        init(state: CombatState, elfPower: Int = 3) {
            self.state = state
            self.elfPower = elfPower
        }
        
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
            
            for c in state.combatants.sorted(by: { $0.position < $1.position }) {
                guard let index = nextState.combatants.firstIndex(of: c) else {
                    continue
                }
                
                var current = nextState.combatants[index]
                let targets = nextState.combatants
                    .filter { $0.race != current.race }
                
                guard !targets.isEmpty else {
                    return nextState
                }
                
                func move() {
                    let graph = nextState.graph
                    
                    let optionalDestination = targets
                        .flatMap { $0.position.cardinalNeighbours }
                        .compactMap { graph.node(atGridPosition: $0.int2) }
                        .flatMap { end -> [[GKGraphNode]] in
                            current.position
                                .cardinalNeighbours
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
                        nextState.move(combatant: &current,
                                       to: destination.gridPosition.point)
                    }
                }
                
                @discardableResult
                func attack() -> Bool {
                    guard let target = targets
                        .filter({ current.position.cardinalNeighbours.contains($0.position) })
                        .sorted(by: { $0.position < $1.position })
                        .min(by: { $0.health < $1.health }) else {
                            return false
                    }

                    nextState.attack(target: target,
                                     power: current.race == .elf ? elfPower : 3)
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
    
    struct CombatStatePrinter {
        let emptyMap: [[String]]
        
        init(input: Input) {
            self.emptyMap = input.lines.map { l -> [String] in
                l.characters
                    .map { $0 == "E" || $0 == "G" ? "." : String($0) }
            }
        }
        
        func print(state: CombatState) {
            var map = emptyMap
            state.combatants
                .sorted(by: { $0.position < $1.position })
                .forEach({ (combatant) in
                    let point = combatant.position
                    map[point.y][point.x] = combatant.race.rawValue
                    map[point.y].append(" \(combatant.description)")
                })
            Swift.print("Round", state.number)
            Swift.print(map.map({ $0.joined() }).joined(separator: "\n"))
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
    
    public func part1Solution(for input: Input) -> String {
        let input = input
//        let printer = CombatStatePrinter(input: input)
        
        let startState = combatState(from: input)
        let runner = CombatRunner(state: startState)
//            .map { state -> CombatState in
//                printer.print(state: state)
//                return state
//            }
        let finalState = Array(runner).last
        
        return "\(finalState?.outcome ?? -1)"
    }

    public func part2Solution(for input: Input) -> String {
        let input = input
//        let printer = CombatStatePrinter(input: input)
        let elfCount = combatState(from: input).combatants
            .filter { $0.race == .elf }.count
        
        var iterator = ExponentialSearchIterator(value: 4)
        
        var result: (strength: UInt, outcome: Int) = (.max, 0)
        var success = false
        while let i = iterator.next() {
            let startState = combatState(from: input)
            let runner = CombatRunner(state: startState, elfPower: Int(i))
//                .map { state -> CombatState in
//                    printer.print(state: state)
//                    return state
//                }
            guard let finalState = Array(runner).last else { break }
            
            let allSurvived = finalState.combatants.first?.race == .elf
                && finalState.combatants.count == elfCount
            
//            print("Strength:", i)
//            print("All Survived:", allSurvived)
            
            if allSurvived {
                result = (min(i, result.strength), finalState.outcome)
            }
            
            if !success, allSurvived {
                success.toggle()
                iterator.toggleDirection()
            } else if success, !allSurvived {
                success.toggle()
                iterator.toggleDirection()
            }
        }
        
        return "\(result.outcome)"
    }
}
