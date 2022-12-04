import Foundation
import AdventOfCode

func printSolution(for day: any Day) {
    let formatter = MeasurementFormatter()
    
    func time(solution: @autoclosure () -> CustomStringConvertible) {
        let start = Date()
        let answer = solution()
        let duration = Measurement(value: -start.timeIntervalSinceNow, unit: UnitDuration.seconds)
        print(answer, "(\(formatter.string(from: duration)))\n")
    }
        
    print("Part 1:")
    time(solution: day.part1Solution())
    
    print("Part 2:")
    time(solution: day.part2Solution())
}

func yearFromInput() -> Year {
    func year(for year: Int?) -> Year? {
        AdventOfCode.years.first { $0.number == year }
    }
    
    if let year = year(for: CommandLine.arguments.first.flatMap({ Int($0) })) {
        CommandLine.arguments.removeFirst()
        return year
    }

    print("What year do you want to run? (default latest)")
    print("    " + years.map { String($0.number) }.joined(separator: ", "))

    if let year = year(for: readLine().flatMap { Int($0) }) {
        return year
    }

    return AdventOfCode.years.last!
}

func dayFromInput(for year: Year) -> any Day {
    func day(for day: Int?) -> (any Day)? {
        year.days.first { $0.number == day }
    }
    
    if let day = day(for: CommandLine.arguments.first.flatMap({ Int($0) })) {
        CommandLine.arguments.removeFirst()
        return day
    }
    
    print("What day do you want to run? (default latest)")
    print("    " + year.days.map { String($0.number) }.joined(separator: ", "))

    if let day = day(for: readLine().flatMap { Int($0) }) {
        return day
    }

    return year.days.last!
}

CommandLine.arguments.removeFirst()

let year = yearFromInput()
let day = dayFromInput(for: year)
printSolution(for: day)
