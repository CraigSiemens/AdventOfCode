//
//  File.swift
//  
//
//  Created by Craig Siemens on 2019-12-05.
//

import Foundation

public struct IntcodeProgram {
    var memory: [Int]
    
    public init(_ string: String) {
        self.init(string
            .components(separatedBy: ",")
            .integers)
    }
    
    public init(_ memory: [Int]) {
        self.memory = memory
    }
    
    subscript(index: Int) -> Int {
        get { memory[index] }
        set(newValue) { memory[index] = newValue }
    }
}
