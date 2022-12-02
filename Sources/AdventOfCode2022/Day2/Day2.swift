import Foundation
import Algorithms

public struct Day2: Day {
    enum Move: Int, CaseIterable {
        case rock, paper, scissors
        
        init(string: String) {
            switch string {
            case "A", "X":
                self = .rock
            case "B", "Y":
                self = .paper
            case "C", "Z":
                self = .scissors
            default:
                fatalError()
            }
        }
        
        func score(vs opponent: Move) -> Int {
            let moveScore = rawValue + 1
            let resultScore: Int
            
            switch (self, opponent) {
            case (.paper, .rock), (.rock, .scissors), (.scissors, .paper):
                resultScore = 6
            case (_, self):
                resultScore = 3
            default:
                resultScore = 0
            }
            
            return moveScore + resultScore
        }
        
        func move(for result: Result) -> Self {
            Self.allCases[wrappingIndex: rawValue + result.rawValue]
        }
    }
    
    enum Result: Int {
        case lose = -1
        case draw
        case win
        
        init(string: String) {
            switch string {
            case "X":
                self = .lose
            case "Y":
                self = .draw
            case "Z":
                self = .win
            default:
                fatalError()
            }
        }
    }
    
    public func part1Solution(for input: Input) -> String {
        let value = input.lines
            .map(\.words)
            .map {
                let opponentMove = Move(string: $0[0].raw)
                let myMove = Move(string: $0[1].raw)
                return myMove.score(vs: opponentMove)
            }
            .sum()
        
        return "\(value)"
    }

    public func part2Solution(for input: Input) -> String {
        let value = input.lines
            .map(\.words)
            .map {
                let opponentMove = Move(string: $0[0].raw)
                let result = Result(string: $0[1].raw)
                let myMove = opponentMove.move(for: result)
                return myMove.score(vs: opponentMove)
            }
            .sum()

        return "\(value)"
    }
}
