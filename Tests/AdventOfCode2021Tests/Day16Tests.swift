import Testing
@testable import AdventOfCode2021

struct Day16Tests {
    let day = Day16()
    
    let input: Input = "d2fe28"
    
    @Test func part1() {
        #expect(day.part1Solution(for: "D2FE28") == "6")
        #expect(day.part1Solution(for: "8A004A801A8002F478") == "16")
        #expect(day.part1Solution(for: "620080001611562C8802118E34") == "12")
        #expect(day.part1Solution(for: "C0015000016115A2E0802F182340") == "23")
        #expect(day.part1Solution(for: "A0016C880162017C3686B18A3D4780") == "31")
        #expect(day.part1Solution() == "989")
    }
    
    @Test func part2() {
        #expect(day.part2Solution(for: "C200B40A82") == "3")
        #expect(day.part2Solution(for: "04005AC33890") == "54")
        #expect(day.part2Solution(for: "880086C3E88112") == "7")
        #expect(day.part2Solution(for: "CE00C43D881120") == "9")
        #expect(day.part2Solution(for: "D8005AC2A8F0") == "1")
        #expect(day.part2Solution(for: "F600BC2D8F") == "0")
        #expect(day.part2Solution(for: "9C005AC2F8F0") == "0")
        #expect(day.part2Solution(for: "9C0141080250320F1802104A08") == "1")
        #expect(day.part2Solution() == "7936430475134")
    }
}
