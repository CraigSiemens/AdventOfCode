struct LetterMatcher {
    private let characters: [[Character]]
    
    init(string: String) {
        self.characters = string
            .components(separatedBy: "\n")
            .map(Array.init)
    }
    
    func matchingLetters() -> String? {
        guard let column = nextNonWhitespaceColumn(from: 0)
        else { return nil }
        var charactersColIndex = column
        
        var string = ""
        
        while characters.first!.indices.contains(charactersColIndex) {
            let letter = Letter.all
                .first { matches(letter: $0, atCol: charactersColIndex) }
            
            guard let letter else { return nil }
            
            string.append(letter.character)
            charactersColIndex += letter.width
            
            guard let column = nextNonWhitespaceColumn(from: charactersColIndex)
            else { break }
            charactersColIndex = column
        }
        
        return string
    }
    
    func nextNonWhitespaceColumn(from startingColumn: Int) -> Int? {
        var column = startingColumn - 1
        
        var isWhitespace = true
        repeat {
            column += 1
            
            for row in characters {
                guard row.indices.contains(column) else { return nil }
                
                isWhitespace = isWhitespace && row[column] == " "
            }
        } while isWhitespace
        
        return column
    }
    
    func matches(letter: Letter, atCol charactersColIndex: Int) -> Bool {
        for (rowIndex, row) in letter.pattern.enumerated() {
            guard characters.indices.contains(rowIndex)
            else { return false }
            
            for (colOffset, value) in row.enumerated() {
                let colIndex = charactersColIndex + colOffset
                if value {
                    guard characters[rowIndex].indices.contains(colIndex)
                    else { return false }
                    
                    guard characters[rowIndex][colIndex] == "#"
                    else { return false }
                } else {
                    if characters[rowIndex].indices.contains(colIndex) {
                        guard characters[rowIndex][colIndex] == " "
                        else { return false }
                    }
                }
            }
        }
        
        return true
    }
}

public extension String {
    func matchingLetters() -> String? {
        LetterMatcher(string: self).matchingLetters()
    }
}
