import Foundation

public struct Day6: Day {
    func countFish(input: String, afterDays days: Int) -> Int {
        let fish = input.components(separatedBy: ",").integers
        
        var fishByDay = Array(repeating: 0, count: 9)
        
        fish.forEach { fishByDay[$0] += 1 }
        
        for _ in 0..<days {
            let fish = fishByDay.removeFirst()
            fishByDay.append(fish)
            fishByDay[6] += fish
        }
        
        return fishByDay.sum()

    }
    
    public func part1Solution(for input: String = input) -> String {
        return countFish(input: input, afterDays: 80).description
    }

    public func part2Solution(for input: String = input) -> String {
        return countFish(input: input, afterDays: 256).description
    }
}
