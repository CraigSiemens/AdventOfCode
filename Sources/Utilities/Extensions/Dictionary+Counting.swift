import Foundation

public extension Dictionary where Value == Int {
    init<C>(counting: C) where C: Collection, C.Element == Key {
        self.init()
        for k in counting {
            self[k, default: 0] += 1
        }
    }
}
