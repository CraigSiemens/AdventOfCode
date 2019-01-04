import Foundation
import Utilities
import Day1
import Day2
import Day3
import Day4
import Day5
import Day6
import Day7
import Day8
import Day9
import Day10
import Day11
import Day12
import Day13
import Day14
import Day15
// {IMPORTS}

typealias SolvableDay = Day & HasInput

if #available(OSX 10.12, *) {
    let days: [SolvableDay] = [
        Day1(),
        Day2(),
        Day3(),
        Day4(),
        Day5(),
        Day6(),
        Day7(),
        Day8(),
        Day9(),
        Day10(),
        Day11(),
        Day12(),
        Day13(),
        Day14(),
        Day15(),
        // {DAYS}
    ]
    
    func printSolution(for day: SolvableDay) {
        let formatter = MeasurementFormatter()
        
        func time(solution: @autoclosure () -> String) {
            let start = Date()
            let answer = solution()
            let duration = Measurement(value: -start.timeIntervalSinceNow, unit: UnitDuration.seconds)
            print(answer, "(\(formatter.string(from: duration)))")
        }
        
        print("\(type(of: day))")
        
        print("Part 1:")
        time(solution: day.part1Solution())
        
        print("Part 2:")
        time(solution: day.part2Solution())
    }
    
    print("What day do you want to run?")
    
    let number =
        CommandLine
            .arguments
            .last
            .flatMap { Int($0) }
            ?? readLine()
                .flatMap { Int($0) }
            ?? days.count
    
    let index = number - 1
    guard days.indices.contains(index) else {
        print("\(number) is not in 1...\(days.count)")
        exit(1)
    }
    
    printSolution(for: days[index])
} else {
    fatalError("Update your computer")
}
