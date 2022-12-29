import Algorithms
import Foundation
import Utilities

public struct Day19: Day {
    struct Blueprint {
        let id: Int
        let oreRobotCost: Int
        let clayRobotCost: Int
        let obsidianRobotCost: (ore: Int, clay: Int)
        let geodeRobotCost: (ore: Int, obsidian: Int)
        
        let maxOreCost: Int
        
        init(id: Int, oreRobotCost: Int, clayRobotCost: Int, obsidianRobotCost: (ore: Int, clay: Int), geodeRobotCost: (ore: Int, obsidian: Int)) {
            self.id = id
            self.oreRobotCost = oreRobotCost
            self.clayRobotCost = clayRobotCost
            self.obsidianRobotCost = obsidianRobotCost
            self.geodeRobotCost = geodeRobotCost
            
            self.maxOreCost = max(oreRobotCost, clayRobotCost, obsidianRobotCost.ore, geodeRobotCost.ore)
        }
    }
    
    struct State {
        var timeRemaining: Int = 24
        
        var oreRobots: Int = 1
        var clayRobots: Int = 0
        var obsidianRobots: Int = 0
        var geodeRobots: Int = 0
        
        var ore: Int = 0
        var clay: Int = 0
        var obsidian: Int = 0
        var geode: Int = 0
        
        mutating func advanceTime(by time: Int = 1) throws {
            struct OutOfTime: Error {}
            
            let time = min(time, timeRemaining)
            guard time > 0 else { throw OutOfTime() }
            
            timeRemaining -= time
            ore += time * oreRobots
            clay += time * clayRobots
            obsidian += time * obsidianRobots
            geode += time * geodeRobots
        }
        
        mutating func buildOreRobot(using blueprint: Blueprint) throws {
            struct TooManyOreRobots: Error {}
            
            guard oreRobots < blueprint.maxOreCost,
                  oreRobots * timeRemaining + ore < timeRemaining * blueprint.maxOreCost
            else { throw TooManyOreRobots() }
            
            while blueprint.oreRobotCost > ore {
                try advanceTime()
            }
            
            ore -= blueprint.oreRobotCost
            try advanceTime()
            oreRobots += 1
        }
        
        mutating func buildClayRobot(using blueprint: Blueprint) throws {
            struct TooManyClayRobots: Error {}
            
            // It seems like there are cases when having more clay robots is needed.
            guard clayRobots < blueprint.obsidianRobotCost.clay
//                  clayRobots * timeRemaining + clay < timeRemaining * blueprint.obsidianRobotCost.clay
            else { throw TooManyClayRobots() }
            
            while blueprint.clayRobotCost > ore {
                try advanceTime()
            }
            
            ore -= blueprint.clayRobotCost
            try advanceTime()
            clayRobots += 1
        }
        
        mutating func buildObsidianRobot(using blueprint: Blueprint) throws {
            struct TooManyObsidianRobots: Error {}
            
            guard obsidianRobots < blueprint.geodeRobotCost.obsidian,
                  obsidianRobots * timeRemaining + obsidian < timeRemaining * blueprint.geodeRobotCost.obsidian
            else { throw TooManyObsidianRobots() }
            
            while blueprint.obsidianRobotCost.ore > ore
                    || blueprint.obsidianRobotCost.clay > clay {
                try advanceTime()
            }
            
            ore -= blueprint.obsidianRobotCost.ore
            clay -= blueprint.obsidianRobotCost.clay
            try advanceTime()
            obsidianRobots += 1
        }
        
        mutating func buildGeodeRobot(using blueprint: Blueprint) throws {
            while blueprint.geodeRobotCost.ore > ore
                    || blueprint.geodeRobotCost.obsidian > obsidian {
                try advanceTime()
            }
            
            ore -= blueprint.geodeRobotCost.ore
            obsidian -= blueprint.geodeRobotCost.obsidian
            try advanceTime()
            geodeRobots += 1
        }
    }
    
    func findBestState(from initialState: State, blueprint: Blueprint) -> State {
        var bestState = initialState
        
        func doAction(_ action: (inout State) throws -> Void) {
            do {
                var state = initialState
                try action(&state)
                state = autoreleasepool { findBestState(from: state, blueprint: blueprint) }
                
                if state.geode > bestState.geode {
                    bestState = state
                }
            } catch {}
        }
        
        doAction { try $0.buildGeodeRobot(using: blueprint) }
        doAction { try $0.buildObsidianRobot(using: blueprint) }
        doAction { try $0.buildClayRobot(using: blueprint) }
        doAction { try $0.buildOreRobot(using: blueprint) }
        
        return bestState
    }
    
    func parse(input: Input) -> [Blueprint] {
        input.lines.map {
            let v = $0.words(byCharactersIn: " :").integers
            return Blueprint(
                id: v[0],
                oreRobotCost: v[1],
                clayRobotCost: v[2],
                obsidianRobotCost: (ore: v[3], clay: v[4]),
                geodeRobotCost: (ore: v[5], obsidian: v[6])
            )
        }
    }
    
    public func part1Solution(for input: Input) -> Int {
        parse(input: input)
            .map { findBestState(from: .init(), blueprint: $0).geode * $0.id }
            .sum()
    }

    public func part2Solution(for input: Input) -> Int {
        parse(input: input)
            .prefix(3)
            .map { findBestState(from: .init(timeRemaining: 32), blueprint: $0).geode }
            .product()
    }
}
