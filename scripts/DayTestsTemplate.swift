import Testing
import Utilities
@testable import AdventOfCode{YEAR_NUMBER}

struct {DAY_NAME}Tests {
    let day = {DAY_NAME}()
    
//    let input: Input = """
//    <#input#>
//    """
    
    @Test func part1() {
//        #expect(day.part1Solution(for: input) == <#{RETURN_VALUE}#>)
//        #expect(day.part1Solution(for: "<#input#>") == <#{RETURN_VALUE}#>)
        #expect(day.part1Solution() == {RETURN_VALUE})
    }
    
    @Test func part2() {
//        #expect(day.part2Solution(for: input) == <#{RETURN_VALUE}#>)
//        #expect(day.part2Solution(for: "<#input#>") == <#{RETURN_VALUE}#>)
        #expect(day.part2Solution() == {RETURN_VALUE})
    }
}
