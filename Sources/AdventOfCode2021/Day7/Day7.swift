import Foundation

public struct Day7: Day {
    public func part1Solution(for input: String = input) -> String {
        var shipsAtPosition: [Int: Int] = [:]
        
        Input(input).commaSeparatedWords.integers
            .forEach { shipsAtPosition[$0, default: 0] += 1 }
        
        var minPosition = shipsAtPosition.keys.min()!
        var maxPosition = shipsAtPosition.keys.max()!
        
        var fuelCost = 0
        while minPosition != maxPosition,
              let minShips = shipsAtPosition[minPosition],
              let maxShips = shipsAtPosition[maxPosition] {
            
            if minShips < maxShips {
                shipsAtPosition.removeValue(forKey: minPosition)
                minPosition += 1
                
                shipsAtPosition[minPosition, default: 0] += minShips
                fuelCost += minShips
            } else {
                shipsAtPosition.removeValue(forKey: maxPosition)
                maxPosition -= 1
                
                shipsAtPosition[maxPosition, default: 0] += maxShips
                fuelCost += maxShips
            }
        }

        return fuelCost.description
    }

    public func part2Solution(for input: String = input) -> String {
        struct Ships {
            var totalFuelCost = 0
            var previousFuelCost = 0
            var count = 0
            
            var nextFuelCost: Int { previousFuelCost + count }
        }
        
        var shipsAtPosition: [Int: Ships] = [:]
        
        Input(input).commaSeparatedWords.integers
            .forEach { shipsAtPosition[$0, default: .init()].count += 1 }
        
        var minPosition = shipsAtPosition.keys.min()!
        var maxPosition = shipsAtPosition.keys.max()!
        
        while minPosition != maxPosition,
              let minShips = shipsAtPosition[minPosition],
              let maxShips = shipsAtPosition[maxPosition] {
                        
            if minShips.nextFuelCost < maxShips.nextFuelCost {
                shipsAtPosition.removeValue(forKey: minPosition)
                minPosition += 1
                
                var ships = shipsAtPosition[minPosition, default: .init()]
                ships.count += minShips.count
                ships.previousFuelCost += minShips.count + minShips.previousFuelCost
                ships.totalFuelCost += minShips.count + minShips.previousFuelCost + minShips.totalFuelCost
                shipsAtPosition[minPosition] = ships
            } else {
                shipsAtPosition.removeValue(forKey: maxPosition)
                maxPosition -= 1
                
                var ships = shipsAtPosition[maxPosition, default: .init()]
                ships.count += maxShips.count
                ships.previousFuelCost += maxShips.nextFuelCost
                ships.totalFuelCost += maxShips.nextFuelCost + maxShips.totalFuelCost
                shipsAtPosition[maxPosition] = ships
            }
        }
        
        return shipsAtPosition.first!.value.totalFuelCost.description
    }
}
