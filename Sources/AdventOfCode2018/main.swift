import Foundation
import Utilities
import Day1
import Day2
import Day3
import Day4
// {IMPORTS}

//print("What day do you want to run?")
//guard let input = readLine() else {
//    exit(1)
//}

func printSolution(for day: Day & HasInput) {
    print("\(type(of: day))")
    print("Part 1:", day.part1Solution())
    print("Part 2:", day.part2Solution())
}

printSolution(for: Day1())
printSolution(for: Day2())
printSolution(for: Day3())
printSolution(for: Day4())
