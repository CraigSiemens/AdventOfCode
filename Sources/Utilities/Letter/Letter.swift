struct Letter {
    let character: Character
    
    // True requires a matching character, false matches whitespace or nothing.
    var pattern: [[Bool]]
    var patternString: String
    
    var width: Int
    var height: Int
    
    init(character: Character, pattern: String) {
        self.character = character
        
        let lines = pattern.split(separator: "\n")
        
        let width = lines.map(\.count).max() ?? 0
        self.width = width
        self.height = lines.count
        
        self.pattern = lines
            .map { line in
                line
                    .padding(toLength: width, withPad: " ", startingAt: 0)
                    .map { $0 == "#" }
            }
        
        self.patternString = pattern
    }
}

extension Letter {
    // See TODOs below for the missing characters
    static let all = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z]
        .filter { $0.height != 0 }

    static let a = Letter(
        character: "A",
        pattern: """
         ##
        #  #
        #  #
        ####
        #  #
        #  #
        """
    )
    
    static let b = Letter(
        character: "B",
        pattern: """
        ###
        #  #
        ###
        #  #
        #  #
        ###
        """
    )
    
    static let c = Letter(
        character: "C",
        pattern: """
         ##
        #  #
        #
        #
        #  #
         ##
        """
    )
    
    static let d = Letter(
        character: "D",
        pattern: """
        ###
        #  #
        #  #
        #  #
        #  #
        ###
        """
    )
    
    static let e = Letter(
        character: "E",
        pattern: """
        ####
        #
        ###
        #
        #
        ####
        """
    )
    
    static let f = Letter(
        character: "F",
        pattern: """
        ####
        #
        ###
        #
        #
        #
        """
    )
    
    static let g = Letter(
        character: "G",
        pattern: """
         ##
        #  #
        #
        # ##
        #  #
         ###
        """
    )
    
    static let h = Letter(
        character: "H",
        pattern: """
        #  #
        #  #
        ####
        #  #
        #  #
        #  #
        """
    )

    // TODO: Add the pattern for "I" then add to `all` above.
    static let i = Letter(
        character: "I",
        pattern: ""
    )
    
    static let j = Letter(
        character: "J",
        pattern: """
          ##
           #
           #
           #
        #  #
         ##
        """
    )
    
    static let k = Letter(
        character: "K",
        pattern: """
        #  #
        # #
        ##
        # #
        # #
        #  #
        """
    )
    
    static let l = Letter(
        character: "L",
        pattern: """
        #
        #
        #
        #
        #
        ####
        """
    )

    // TODO: Add the pattern for "M" then add to `all` above.
    static let m = Letter(
        character: "M",
        pattern: ""
    )
    
    static let n = Letter(
        character: "N",
        pattern: """
        #  #
        ## #
        ## #
        # ##
        # ##
        #  #
        """
    )
    
    static let o = Letter(
        character: "O",
        pattern: """
         ##
        #  #
        #  #
        #  #
        #  #
         ##
        """
    )
    
    static let p = Letter(
        character: "P",
        pattern: """
        ###
        #  #
        #  #
        ###
        #
        #
        """
    )

    // TODO: Add the pattern for "Q" then add to `all` above.
    static let q = Letter(
        character: "Q",
        pattern: ""
    )
    
    static let r = Letter(
        character: "R",
        pattern: """
        ###
        #  #
        #  #
        ###
        # #
        #  #
        """
    )

    // TODO: Add the pattern for "S" then add to `all` above.
    static let s = Letter(
        character: "S",
        pattern: ""
    )

    // TODO: Add the pattern for "T" then add to `all` above.
    static let t = Letter(
        character: "T",
        pattern: ""
    )
    
    static let u = Letter(
        character: "U",
        pattern: """
        #  #
        #  #
        #  #
        #  #
        #  #
         ##
        """
    )

    // TODO: Add the pattern for "V" then add to `all` above.
    static let v = Letter(
        character: "V",
        pattern: ""
    )

    // TODO: Add the pattern for "W" then add to `all` above.
    static let w = Letter(
        character: "W",
        pattern: ""
    )
    
    static let x = Letter(
        character: "X",
        pattern: """
        #  #
        #  #
         ##
         ##
        #  #
        #  #
        """
    )
    
    static let y = Letter(
        character: "Y",
        pattern: """
        #   #
        #   #
         # #
          #
          #
          #
        """
    )
    
    static let z = Letter(
        character: "Z",
        pattern: """
        ####
           #
          #
         #
        #
        ####
        """
    )
}
