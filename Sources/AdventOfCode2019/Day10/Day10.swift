import Foundation

public struct Day10: Day {

    private func part1Solution(input: String) -> (asteroids: [Point], best: Point, visible: Int) {
        let asteroids = Input(input)
            .lines
            .characters
            .enumerated()
            .flatMap { (y, chars) -> [Point] in
                chars.enumerated().compactMap { (x, char) -> Point? in
                    guard char == "#" else { return nil }
                    return Point(x: x, y: y)
                }
            }
        
        var maxCount = 0
        var bestStation = Point.zero
        for asteroid in asteroids {
            var angles = Set<Point>()
            for other in asteroids {
                guard asteroid != other else { continue }
                angles.insert(asteroid.angle(to: other))
            }
            
            if angles.count > maxCount {
                maxCount = angles.count
                bestStation = asteroid
            }
        }
        
        return (asteroids, bestStation, maxCount)
    }
    
    public func part1Solution(for input: String = input) -> String {
        return "\(part1Solution(input: input).visible)"
    }

    public func part2Solution(for input: String = input) -> String {
        var (asteroids, best, _) = part1Solution(input: input)
        asteroids.remove(at: asteroids.firstIndex(of: best)!)
        print(best)
        var groupedAsteroids = Dictionary(grouping: asteroids) { (point) -> Double in
            let angleFromUp = best.angle(to: point).angle + (.pi / 2)
            return angleFromUp >= 0 ? angleFromUp : angleFromUp + (.pi * 2)
        }
        .mapValues { (asteroids) in
            asteroids.sorted {
                best.manhattanDistance(to: $0) < best.manhattanDistance(to: $1)
            }
        }
        
        var removeCount = 0
        var lastRemoved = Point.zero
        
        for angle in LoopingSequence(groupedAsteroids.keys.sorted()) {
            guard removeCount < 200 else { break }
            
            if groupedAsteroids[angle]?.first != nil {
                removeCount += 1
                lastRemoved = groupedAsteroids[angle]!.removeFirst()
                print(lastRemoved)
            }
        }
        
        return "\(lastRemoved.x * 100 + lastRemoved.y)"
    }
}
