import Foundation

public struct Day5: Day {

    func seatID(for input: String) -> Int {
        let binary = input
            .map {
                $0 == "B" || $0 == "R"
                    ? "1"
                    : "0"
            }
            .joined()
        
        return Int(binary, radix: 2)!
    }
    
    private func parse(input: String) -> [Int] {
        Input(input)
            .lines
            .map(\.raw)
            .map(seatID(for:))
    }
    
    public func part1Solution(for input: String = input) -> String {
        let value = parse(input: input)
            .max()!
                
        return "\(value)"
    }

    public func part2Solution(for input: String = input) -> String {
        let seatIds = parse(input: input)
            .sorted()

        let seat = zip(seatIds, seatIds.dropFirst())
            .first { (currentSeat, nextSeat) -> Bool in
                currentSeat + 1 != nextSeat
            }
            .map { $0.0 + 1 }
        
        return "\(seat!)"
    }
}
