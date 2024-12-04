import Testing

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AdventOfCode2018Tests.allTests),
    ]
}
#endif
