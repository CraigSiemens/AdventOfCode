//
//  File.swift
//  
//
//  Created by Craig Siemens on 2019-12-03.
//

import Foundation

enum IntcodeComputer {
    static func execute(program: [Int]) -> [Int] {
        var program = program
        var instructionPointer = 0
        
        while true {
            let instructionSize: Int
            
            switch program[instructionPointer] {
            case 1: // Addition
                instructionSize = 4
                program[program[instructionPointer+3]] = program[program[instructionPointer+1]] + program[program[instructionPointer+2]]
            case 2: // Multiply
                instructionSize = 4
                program[program[instructionPointer+3]] = program[program[instructionPointer+1]] * program[program[instructionPointer+2]]
            case 99: // Finished
                return program
            default:
                fatalError("Unknown Intcode")
            }
            
            instructionPointer += instructionSize
        }
        
        return program
    }

    static func evaluate(program: [Int]) -> Int {
        execute(program: program)[0]
    }
}
