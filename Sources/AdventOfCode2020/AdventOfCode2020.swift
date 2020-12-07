@_exported import Utilities

public struct AdventOfCode2020: Year {
    public let number = 2020
    public let days: [SolvableDay] = [
        Day1(),
        Day2(),
        Day3(),
        Day4(),
        Day5(),
        Day6(),
        Day7(),
        // {DAYS}
    ]
    
    public init() {}
}
