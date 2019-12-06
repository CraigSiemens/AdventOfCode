@_exported import Utilities

public struct AdventOfCode2019: Year {
    public let number = 2019
    public let days: [SolvableDay] = [
        Day1(),
        Day2(),
        Day3(),
        Day4(),
        // {DAYS}
    ]
    
    public init() {}
}
