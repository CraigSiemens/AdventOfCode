import XCTest
@testable import Utilities

final class LetterMatcherTests: XCTestCase {
    func testMatchingLettersSingle() throws {
        for letter in Letter.all {
            let matcher = LetterMatcher(string: letter.patternString)
            
            let match = try XCTUnwrap(matcher.matchingLetters())
            XCTAssertEqual(match, "\(letter.character)")
        }
    }
    
    func testMatchingLettersMultiple() throws {
        let string = """
        #  # #### #    #     ##
        #  # #    #    #    #  #
        #### ###  #    #    #  #
        #  # #    #    #    #  #
        #  # #    #    #    #  #
        #  # #### #### ####  ##
        """
        
        let matcher = LetterMatcher(string: string)
        
        let match = try XCTUnwrap(matcher.matchingLetters())
        XCTAssertEqual(match, "HELLO")
    }
    
    func testMatchingLettersMultipleWhitespace() throws {
        let string = """
         #  #   #### #       #      ##
         #  #   #    #       #     #  #
         ####   ###  #       #     #  #
         #  #   #    #       #     #  #
         #  #   #    #       #     #  #
         #  #   #### ####    ####   ##
        """
        
        let matcher = LetterMatcher(string: string)
        
        let match = try XCTUnwrap(matcher.matchingLetters())
        XCTAssertEqual(match, "HELLO")
    }
}
