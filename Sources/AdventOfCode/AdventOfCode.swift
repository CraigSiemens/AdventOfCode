import Foundation
import AdventOfCode2017
import AdventOfCode2018
import AdventOfCode2019
import AdventOfCode2020
import AdventOfCode2021
import AdventOfCode2022
import AdventOfCode2023
    import AdventOfCode2024
// {YEARS IMPORT}

@_exported import Utilities

public struct AdventOfCode {
    public let years: [Year] = [
        AdventOfCode2017(),
        AdventOfCode2018(),
        AdventOfCode2019(),
        AdventOfCode2020(),
        AdventOfCode2021(),
        AdventOfCode2022(),
        AdventOfCode2023(),
        AdventOfCode2024(),
        // {YEARS}
    ]
    
    public init() {}
}
