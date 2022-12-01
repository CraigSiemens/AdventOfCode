import Foundation

struct Day4: Day {

    enum GuardAction {
        case begin(id: Int)
        case sleep(time: Int)
        case wake(time: Int)
        
        init?(line: String) {
            let scanner = Scanner(string: line)
            
            if line.hasSuffix("begins shift"),
                scanner.scanUpToString("#") != nil,
                let id = scanner.nextInt() {
                self = .begin(id: id)
            } else if line.hasSuffix("falls asleep"),
                scanner.scanUpToString(":") != nil,
                let time = scanner.nextInt() {
                self = .sleep(time: time)
            } else if line.hasSuffix("wakes up"),
                scanner.scanUpToString(":") != nil,
                let time = scanner.nextInt() {
                self = .wake(time: time)
            } else {
                return nil
            }
        }
    }
    
    struct GuardSleepTime {
        var id: Int
        var begin: Int
        var end: Int
        
        var isPartial: Bool {
            return id == .min || begin == .min || end == .min
        }
    }
    
    struct GuardSleepCount {
        let id: Int
        var minuteCount = Array(repeating: 0, count: 60)
        var totalCount = 0
        var max: (index: Int, value: Int) = (0, 0)
        
        init(id: Int) {
            self.id = id
        }
        
        mutating func add(sleepTime: GuardSleepTime) {
            for min in sleepTime.begin..<sleepTime.end {
                minuteCount[min] += 1
                totalCount += 1
                if minuteCount[min] > max.value {
                    max = (min, minuteCount[min])
                }
            }
        }
    }
    
    func parse(input: Input) -> [GuardSleepCount] {
        return input
            .lines
            .sorted()
            .compactMap { GuardAction(line: $0.raw) }
            .reduce(into: [GuardSleepTime](), { (result, action) -> Void in
                switch action {
                case .begin(let id):
                    result.append(GuardSleepTime(id: id, begin: .min, end: .min))
                case .sleep(let time):
                    guard let last = result.last else { return }
                    if !last.isPartial {
                        result.append(GuardSleepTime(id: last.id, begin: .min, end: .min))
                    }
                    result[result.count - 1].begin = time
                case .wake(let time):
                    result[result.count - 1].end = time
                }
            })
            .filter { !$0.isPartial }
            .reduce(into: [Int: GuardSleepCount](), { (result, sleepTime) -> Void in
                result[sleepTime.id, default: GuardSleepCount(id: sleepTime.id)]
                    .add(sleepTime: sleepTime)
            })
            .map { $0.value }
    }
    
    public func part1Solution(for input: Input) -> String {
        guard let sleepCount = parse(input: input).max(by: { $0.totalCount < $1.totalCount }),
            let (index, _) = sleepCount.minuteCount.enumerated().max(by: { $0.element < $1.element }) else {
                return "unknown"
        }
        
        return "\(sleepCount.id * index)"
    }

    public func part2Solution(for input: Input) -> String {
        guard let sleepCount = parse(input: input).max(by: { $0.max.value < $1.max.value }) else {
                return "unknown"
        }
        
        return "\(sleepCount.id * sleepCount.max.index)"
    }
}
