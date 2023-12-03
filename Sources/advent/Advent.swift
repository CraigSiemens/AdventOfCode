import ArgumentParser
import AdventOfCode
import Foundation

@main
struct Advent: ParsableCommand {
    @Option(name: .shortAndLong, help: "The year to run, defaults to latest.")
    var year: Int? = nil
    
    @Option(name: .shortAndLong, help: "The day to run, defaults to latest.")
    var day: Int? = nil
    
    @Flag(help: "The part to run.")
    var part: Part = .allParts
    
    private var selectedYear: Year? {
        if let year {
            return AdventOfCode.years.first { $0.number == year }
        }
        return AdventOfCode.years.last
    }
    
    private var selectedDay: (any Day)? {
        if let day {
            return selectedYear?.days.first { $0.number == day }
        }
        return selectedYear?.days.last
    }
    
    mutating func run() throws {
        guard let selectedDay else {
            throw ValidationError("Invalid year or day")
        }
        
        if part == .part1 || part == .allParts {
            run(part: selectedDay.part1Solution, named: "Part 1")
        }
        
        if part == .part2 || part == .allParts {
            run(part: selectedDay.part2Solution, named: "Part 2")
        }
    }
    
    private func run(part: () -> CustomStringConvertible, named name: String) {
        print("\(name): ", terminator: "")
        
        var answer: CustomStringConvertible?
        let duration = ContinuousClock().measure {
            answer = part()
        }
        
        let style = Duration.UnitsFormatStyle(
            allowedUnits: [.seconds, .milliseconds],
            width: .narrow
        )
        print("(\(duration.formatted(style)))")
        print(answer!)
    }
}

extension Advent {
    enum Part: String, EnumerableFlag {
        case part1
        case part2
        case allParts
    }
}
