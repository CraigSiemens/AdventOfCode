import Foundation

struct Day12: Day {

    struct PlantLine {
        let number: Int
        private(set) var plants: [Point: Bool]
        
        lazy var plantNumberSum: Int = {
            return plants.filter { $0.value }.keys.map { $0.x }.sum()
        }()
        
        init(state: String) {
            let keyValues = state
                .enumerated()
                .map { (Point(x: $0.offset, y: 0), $0.element == "#") }
            number = 0
            plants = Dictionary(uniqueKeysWithValues: keyValues)
        }
        
        init(number: Int) {
            self.number = number
            plants = [:]
        }
        
        func next(with rules: Rules) -> PlantLine {
            var (min, max) = plants.keys.extremes()
            min.x -= 3
            max.x += 3
            
            var nextPlantLine = PlantLine(number: number + 1)
            for p in Point.all(in: min.x...max.x, 0...0) {
                let neighbours: [Point] = [
                    p.moved(.west).moved(.west),
                    p.moved(.west),
                    p,
                    p.moved(.east),
                    p.moved(.east).moved(.east)
                ]
                
                let state = neighbours.map { plants[$0, default: false] }
                if rules[state] {
                    nextPlantLine.plants[p] = true
                }
            }
            return nextPlantLine
        }
    }
    
    struct Rules {
        private let rules: [[Bool]: Bool]
        
        init(lines: [Line]) {
            let keyValues = lines
                .map { $0.words }
                .map { words in (words[0].raw.map { $0 == "#" }, words[2].raw == "#") }
            rules = Dictionary(uniqueKeysWithValues: keyValues)
        }
        
        subscript(key: [Bool]) -> Bool {
            get {
                return rules[key, default: false]
            }
        }
    }
    
    public func part1Solution(for input: Input) -> String {
        let lines = input.lines.filter { !$0.raw.isEmpty }

        var plantLine = PlantLine(state: lines[0].words[2].raw)
        let rules = Rules(lines: Array(lines.dropFirst()))
        
        for _ in 0..<20 {
            plantLine = plantLine.next(with: rules)
        }
        
        return "\(plantLine.plantNumberSum)"
    }

    public func part2Solution(for input: Input) -> String {
        let lines = input.lines.filter { !$0.raw.isEmpty }
        
        var plantLine = PlantLine(state: lines[0].words[2].raw)
        let rules = Rules(lines: Array(lines.dropFirst()))
        
        var previousSum = 0
        var lastOffset = 0
        let generations = 50000000000
        for _ in 0..<generations {
            plantLine = plantLine.next(with: rules)
            
            let offset = plantLine.plantNumberSum - previousSum
            previousSum = plantLine.plantNumberSum
            
            guard lastOffset != offset else {
                break
            }
            lastOffset = offset
        }
        
        return "\(plantLine.plantNumberSum + (generations - plantLine.number) * lastOffset)"
    }
}
