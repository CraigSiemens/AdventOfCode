//
//  File.swift
//  
//
//  Created by Neo on 2021-12-08.
//

import Foundation

public extension Int {
    init(digits: [Int]) {
        var value = 0
        
        for digit in digits {
            assert(digit <= 10, "Digit is too large")
            value *= 10
            value += digit
        }
        
        self = value
    }
}
