import Testing
@testable import Utilities

struct LetterMatcherTests {
    @Test func matchingLettersSingle() throws {
        for letter in Letter.all {
            let matcher = LetterMatcher(string: letter.patternString)
            
            let match = try #require(matcher.matchingLetters())
            #expect(match == "\(letter.character)")
        }
    }
    
    @Test func matchingLettersMultiple() throws {
        let string = """
        #  # #### #    #     ##
        #  # #    #    #    #  #
        #### ###  #    #    #  #
        #  # #    #    #    #  #
        #  # #    #    #    #  #
        #  # #### #### ####  ##
        """
        
        let matcher = LetterMatcher(string: string)
        
        let match = try #require(matcher.matchingLetters())
        #expect(match == "HELLO")
    }
    
    @Test func matchingLettersMultipleWhitespace() throws {
        let string = """
         #  #   #### #       #      ##
         #  #   #    #       #     #  #
         ####   ###  #       #     #  #
         #  #   #    #       #     #  #
         #  #   #    #       #     #  #
         #  #   #### ####    ####   ##
        """
        
        let matcher = LetterMatcher(string: string)
        
        let match = try #require(matcher.matchingLetters())
        #expect(match == "HELLO")
    }
}
