import Algorithms
import Foundation
import Utilities

public struct Day9: Day {
    public func part1Solution(for input: Input) -> Int {
        var blockRanges: [BlockRange] = []
        for (offset, length) in input.characters.integers.enumerated() {
            let id = offset.isMultiple(of: 2) ? offset / 2 : nil
            blockRanges.append(.init(id: id, length: length))
        }
        
        var insertableRanges = blockRanges.filter { $0.id != nil }
        var insertingRange = insertableRanges.removeLast()
        
        var compressedBlockRanges: [BlockRange] = []
        
        for blockRange in blockRanges {
            if let id = blockRange.id {
                guard id < insertingRange.id! else { break }
                
                compressedBlockRanges.append(blockRange)
                continue
            }
            
            var remainingLength = blockRange.length
            while remainingLength > 0 {
                let length = min(remainingLength, insertingRange.length)
                remainingLength -= length
                
                var insertedRange = insertingRange
                insertedRange.length = length
                
                compressedBlockRanges.append(insertedRange)
                
                insertingRange.length -= length
                if insertingRange.length == 0 {
                    insertingRange = insertableRanges.removeLast()
                }
            }
        }
        
        if insertingRange.length > 0 {
            compressedBlockRanges.append(insertingRange)
        }
        
        var index = 0
        var checksum = 0
        for blockRange in compressedBlockRanges {
            checksum += blockRange.checksum(at: index)
            index += blockRange.length
        }
        return checksum
    }
    
    public func part2Solution(for input: Input) -> Int {
        var blockRanges: [BlockRange] = []
        for (offset, length) in input.characters.integers.enumerated().reversed() {
            let id = offset.isMultiple(of: 2) ? offset / 2 : nil
            blockRanges.append(.init(id: id, length: length))
        }
        
        var i = 0
        while i < blockRanges.count {
            defer { i += 1 }
            
            let blockRange = blockRanges[i]
            guard blockRange.id != nil else {
                continue
            }
            
            for (j, emptyRange) in blockRanges.enumerated().dropFirst(i + 1).reversed() {
                guard emptyRange.id == nil,
                      emptyRange.length >= blockRange.length
                else { continue }
                
                if emptyRange.length == blockRange.length {
                    blockRanges[j] = blockRange
                } else {
                    blockRanges[j].length -= blockRange.length
                    blockRanges.insert(blockRange, at: j+1)
                }
                blockRanges[i].id = nil
                break
            }
        }
        
        var index = 0
        var checksum = 0
        for blockRange in blockRanges.reversed() {
            checksum += blockRange.checksum(at: index)
            index += blockRange.length
        }
        return checksum
    }
    
    struct BlockRange: CustomStringConvertible {
        var id: Int?
        var length: Int
        
        var description: String {
            String(repeating: id.map { "\($0)" } ?? " ", count: length)
        }
        
        func checksum(at index: Int) -> Int {
            guard let id else { return 0}
            return id * ((length - 1).gaussSum + index * length)
        }
    }
}
