//
//  File.swift
//  
//
//  Created by Neo on 2021-12-03.
//

import Foundation

public extension BinaryInteger {
    init(bits: [Bool]) {
        var i: Self = 0
        for bit in bits {
            i <<= 1
            
            if bit {
                i += 1
            }
        }
        self = i
    }
}
