import Foundation

struct Day9: Day {

    func winnersScore(playerCount: Int, lastMarble: Int) -> Int {
        var scores = Array(repeating: 0, count: playerCount)
        var currentPlayer = 0
        
        var currentMarble = CircularList.Node(0)
        
        for marbleScore in (1...lastMarble) {
            if marbleScore % 23 == 0 {
                currentMarble = currentMarble.previous(by: 7)
                scores[currentPlayer] += marbleScore + currentMarble.value
                currentMarble = currentMarble.remove()
            } else {
                currentMarble = currentMarble.next(by: 1).insert(marbleScore)
            }
            
            currentPlayer = (currentPlayer+1) % scores.count
        }
        
        return scores.max() ?? 0
    }
    
    public func part1Solution(for input: String = input) -> String {
        let integers = Input(input).words.integers
        let score = winnersScore(playerCount: integers[0],
                                 lastMarble: integers[1])
        return "\(score)"
    }

    public func part2Solution(for input: String = input) -> String {
        let integers = Input(input).words.integers
        let score = winnersScore(playerCount: integers[0],
                                 lastMarble: integers[1] * 100)
        return "\(score)"
    }
}
