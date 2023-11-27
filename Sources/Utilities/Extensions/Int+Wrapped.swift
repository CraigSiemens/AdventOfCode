import Foundation

public extension Int {
    func wrapped(in range: ClosedRange<Int>) -> Int {
        var offset = self - range.lowerBound
        
        if offset < 0 {
            offset += range.count
        }
        
        return offset % range.count + range.lowerBound
    }
}
