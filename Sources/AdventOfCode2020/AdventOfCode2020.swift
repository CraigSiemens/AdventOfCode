@_exported import Utilities

public struct AdventOfCode2020: Year {
    public let number = 2020
    public let days: [SolvableDay] = [
        Day1(),
        Day2(),
        Day3(),
        // {DAYS}
    ]
    
    public init() {}
}
