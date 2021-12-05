import Foundation

public struct Day10: Day {
    public func part1Solution(for input: String = input) -> String {
        let lengths = input.components(separatedBy: ",").compactMap { Int($0) }
        let hashed = knotHash(numbers: Array(0..<256), lengths: lengths)
        
        return hashed.prefix(2).reduce(1, *).description
    }

    public func part2Solution(for input: String = input) -> String {
        return knotHash(input: input)
            .map { String(format: "%02x", $0) }
            .joined()
    }
}

func knotHash(numbers: [Int], lengths: [Int], index: Int = 0, skipSize: Int = 0) -> [Int] {
    guard let length = lengths.first else {
        return numbers
    }
    
    let wrappedIndex = { (index: Int) -> Int in index % numbers.count }
    var numbers = numbers
    
    for i in 0..<(length/2) {
        numbers.swapAt(wrappedIndex(index + i), wrappedIndex(index + length - i - 1))
    }
    
    return knotHash(numbers: numbers,
                    lengths: Array(lengths.dropFirst()),
                    index: index + length + skipSize,
                    skipSize: skipSize + 1)
}

func knotHash(input: String) -> [Int] {
    var lengths = input
        .compactMap { $0.unicodeScalars.first?.value }
        .map { Int($0) }
    lengths.append(contentsOf: [17, 31, 73, 47, 23])
    
    lengths = Array(Array(repeating: lengths, count: 64).joined())
    
    return knotHash(numbers: Array(0..<256), lengths: lengths)
        .chunked(into: 16)
        .map { $0.reduce(0, ^) }
}
