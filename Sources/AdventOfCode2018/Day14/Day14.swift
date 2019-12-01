import Foundation

struct Day14: Day {
    public let number: Int = 14

    typealias Recipes = [Int]
    
    func createRecipes(until condition: (Recipes) -> Bool) -> Recipes {
        var recipes: Recipes = [3, 7]
        var elf1Index = 0
        var elf2Index = 1
        
        while !condition(recipes) {
            let sum = recipes[elf1Index] + recipes[elf2Index]
            if sum >= 10 {
                recipes.append(contentsOf: [sum / 10, sum % 10])
            } else {
                recipes.append(sum)
            }
            
            elf1Index = (elf1Index + 1 + recipes[elf1Index]) % recipes.count
            elf2Index = (elf2Index + 1 + recipes[elf2Index]) % recipes.count
        }
        
        return recipes
    }
    
    public func part1Solution(for input: String = input) -> String {
        let number = Input(input).integer!
        
        let recipes = createRecipes { (recipes) -> Bool in
            return recipes.count >= number + 10
        }
        
        return recipes[number..<number+10]
            .map { String($0) }
            .joined()
    }

    public func part2Solution(for input: String = input) -> String {
        let match = Input(input).characters.integers
        
        let recipes = createRecipes { (recipes) -> Bool in
            return recipes.dropLast().suffix(match.count).elementsEqual(match)
                || recipes.suffix(match.count).elementsEqual(match)
        }
        
        let offset = recipes.suffix(match.count).elementsEqual(match) ? 0 : 1
        
        return "\(recipes.dropLast(match.count + offset).count)"
    }
}
